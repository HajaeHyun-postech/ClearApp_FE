# Clear Application Development

Application for postech badminton club CLEAR

## File / Folder discription

 - design : UI design. READ PDF AND PLEASE FOLLOW THIS UI DESIGN
 - assets : Img files folder
 - .gitignore : don't touch it
 - pubspec.yaml : code setting xml
 - popup_widgets : providing pop up widgets. see https://pub.dev/packages/rflutter_alert
 - login/login_info.dart : return name & student id as String format

## 역할 분담

각자 것 구현할 때, model/homelist.dart에 가서 navigate screen 변경해야 올바르게 타짐.

 - 하재현 :
    - 프로젝트 관리
    - 리팩토링 (코드 간결화)
    - 업데이트 확인 구현
    - 각종 에러에 대비
    - post 메소드로 변경하기 (shuttle)

 - 이상오 :
    - 장부 구현
    - 대진표 조회 (윤주형과 상의해서 format을 정확하게 정하고 난 다음 개발에 들어갈 것)
    - 참고할 사이트 (UI) : 
      - https://github.com/mitesh77/Best-Flutter-UI-Template
      - https://github.com/leoelstin/Flutter-UI-Kits
      - https://github.com/nb312/flutter-ui-nice
      - https://github.com/singhbhavneet/Flutter-Dribbble-Challenge
      - https://www.youtube.com/channel/UCJm7i4g4z7ZGcJA_HKHLCVw/videos
      - https://github.com/JoonasN/Flutter-speed-coding---bank-screen
      - https://www.youtube.com/watch?v=JIUBznr0bEk
      - https://github.com/slackvishal/flutter_jobfinder_app (위로 올라가는거)
      - https://www.youtube.com/watch?v=IyFUW7JAvTQ
      - https://www.youtube.com/watch?v=80vWzQB0Eto
      - https://www.youtube.com/watch?v=pDBjEmYU0nw (bottom sheet 만드는 법)
      - https://www.youtube.com/watch?v=neXfa4J752A&t=3s (도로로록)
      - https://www.youtube.com/watch?v=5KbiU-93-yU&t=11s (도로로록 2)
      - https://www.youtube.com/watch?v=UNeXQVXd6oE (카드 도로로록)
      - https://github.com/josealvaradoo/card-wallet-flutter (카드)
      - https://stackoverflow.com/questions/52227846/how-can-i-add-shadow-to-the-widget-in-flutter (box shadow)
      - https://levelup.gitconnected.com/credit-card-slider-flutter-1edec451103a (카드 도오오오오록)

## 브랜치

<u>__commit을 자주 할 것!!!!!!!!!!__</u>

master는 손대지 말 것.

만약에 dev에 수정사항이 생기면, 웬만해선 pull 을 통해 dev 걸 받아온 다음 개발에 착수할 것. 안그러면 나중에 merge 할 때 문제가 발생할 가능성이 높아짐.