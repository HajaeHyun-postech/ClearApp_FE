import 'package:clearApp/exception/auth_exception.dart';
import 'package:clearApp/store/error/error_store.dart';
import 'package:clearApp/store/success/success_store.dart';
import 'package:clearApp/util/http_client.dart';
import 'package:mobx/mobx.dart';

part 'shuttle_form_store.g.dart';

class ShuttleFormStore = _ShuttleFormStore with _$ShuttleFormStore;

abstract class _ShuttleFormStore with Store {
  // other stores:--------------------------------------------------------------
  final ErrorStore errorStore = ErrorStore();
  final SuccessStore successStore = SuccessStore();

  // disposers:-----------------------------------------------------------------
  List<ReactionDisposer> _disposers;

  // constructor:---------------------------------------------------------------

  // store variables:-----------------------------------------------------------
  @observable
  bool loading = false;

  @observable
  bool success = false;

  @observable
  int remaining = 0;

  // actions:-------------------------------------------------------------------
  @action
  Future getRemaining() async {
    if (loading) return;
    loading = true;
    Map<String, dynamic> params = {'type': 'remaining'};

    HttpClient.send(
            method: "GET", address: "/api/clear/shuttle", params: params)
        .then((response) {
          remaining = response['remaining'];
          updateOnSuccess("Loading Complete");
        })
        .catchError((e) => updateOnError("Invalid User"),
            test: (e) => e is AuthException)
        .catchError((e) => updateOnError(e.cause))
        .whenComplete(() => loading = false);
  }

  // dispose:-------------------------------------------------------------------
  @action
  dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  // functions:-----------------------------------------------------------------
  void updateOnError(String message) {
    errorStore.errorMessage = message;
    success = false;
  }

  void updateOnSuccess(String message) {
    successStore.successMessage = message;
    success = true;
  }
}
