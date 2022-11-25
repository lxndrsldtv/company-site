const appTitle = 'LoremIpsum';

const appMenuData = 
'{'
'    "imageLogo": "assets/images/appLogo.png",'
'    "menuItems": {'
'        "menuItem": ['
'            {'
'                "id": "home",'
'                "label": "Home",'
'                "icon": "home",'
'                "isDefault": true'
'            },'
'            {'
'                "id": "about",'
'                "label": "About",'
'                "icon": "info"'
'            },'
'            {'
'                "id": "services",'
'                "label": "Services",'
'                "icon": "design_services"'
'            },'
'            {'
'                "id": "contacts",'
'                "label": "Contacts",'
'                "icon": "contact_page"'
'            }'
'         ]'
'    }'
'}';

const appHomeData = 
'{'
'    "header_1": "What is Lorem Ipsum?",'
'    "header_2": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",'
'    "header_3": "Lorem Ipsum",'
'    "verticalText": "About",'
'    "content": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."'
'}';

const appAboutData =
'{'
'    "header_1": "Why do we use it?",'
'    "header_2": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.",'
'    "header_3": "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",'
'    "verticalText": "About",'
'    "textBlocks": {'
'        "textBlock": ['
'            {'
'                "header": "Lorem ipsum dolor sit amet, consectetur adipiscing elit",'
'                "body": "Quisque ultricies justo convallis dignissim faucibus. Phasellus id neque maximus, volutpat odio ac, malesuada lacus. Aliquam erat volutpat. Duis nulla nulla, malesuada sit amet tincidunt vitae, pharetra et tellus. Maecenas sem nisi, tristique et ligula sit amet, venenatis malesuada nisi. Sed at nunc nec sapien dignissim auctor. Nulla eu tellus pellentesque, dignissim orci non, rhoncus quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed et enim finibus, viverra arcu nec, ullamcorper eros. Maecenas bibendum risus facilisis posuere venenatis. Praesent volutpat orci quis tellus placerat dignissim. Ut erat quam, blandit ac ante sed, dictum gravida lectus."'
'            },'
'            {'
'                "header": "Mauris in est sit amet tortor ultrices facilisis",'
'                "body": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus non consectetur sapien, non molestie leo. Donec euismod gravida bibendum. Etiam a eros sem. Pellentesque eget volutpat sapien. Sed vel dolor sem. Aenean eget risus tincidunt erat euismod ultrices ut sit amet neque. Ut blandit magna at nulla accumsan, eu tempor nulla fermentum. Sed laoreet dui in risus dignissim venenatis. Sed venenatis ante nec velit blandit laoreet. In eu libero aliquam, molestie augue et, scelerisque tortor."'
'            },'
'            {'
'                "header": "Donec sit amet pulvinar leo",'
'                "body": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse blandit elementum ultrices. Suspendisse vulputate metus ac posuere volutpat. In hac habitasse platea dictumst. Quisque dignissim, lacus et sollicitudin volutpat, nisi urna tempus orci, ut tempus felis est vitae orci. Nunc a tortor et nibh ornare tristique. Aenean pharetra libero nec venenatis congue. Nulla facilisi. Nunc quis augue eget nulla eleifend finibus."'
'            }'
'        ]'
'    }'
'}';

const appServicesData =
'{'
'    "header_1": "Where does it come from?",'
'    "header_2": "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",'
'    "verticalText": "History & Facts",'
'    "textBlocks": {'
'        "textBlock": ['
'            {'
'                "header": "Lorem ipsum dolor sit amet, consectetur adipiscing elit",'
'                "body": "Nam in consequat tortor. Mauris sed dictum justo. Phasellus ac condimentum neque. Phasellus et laoreet nisi. Cras luctus lorem et lacinia tempor. Cras eget libero sed diam gravida dapibus sed ut elit. Donec tempus lacinia augue, quis vulputate elit porta ac. Mauris ac nisi nec tortor finibus vulputate nec a dui. Sed sit amet aliquam turpis. Praesent nec est egestas, posuere nunc non, bibendum mi. Curabitur commodo rhoncus orci, nec suscipit tortor lobortis eu. Donec vehicula aliquam tincidunt. Cras ut enim leo. Nulla dictum ut urna in vulputate. Pellentesque dictum tincidunt leo, nec venenatis enim condimentum sit amet. Nullam sit amet vulputate ex, sed bibendum est."'
'            },'
'            {'
'                "header": "Aenean rutrum malesuada justo vitae gravida",'
'                "body": "Nulla sit amet ipsum sit amet arcu auctor dignissim. Ut tellus ex, scelerisque porttitor ipsum ac, accumsan tempor justo. Nulla malesuada vehicula consequat. Morbi pharetra auctor cursus. Aliquam fermentum euismod auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras ultrices odio quam, nec laoreet nisi finibus vitae. Aenean tempor, dui ut malesuada porta, nisl risus varius nibh, vel tempor est lacus ut nibh. Nunc quis mollis massa. Vestibulum eu justo semper, porta mi sit amet, porttitor felis. Etiam eget eros eu arcu molestie varius."'
'            },'
'            {'
'                "header": "Aenean fermentum erat augue, quis lacinia nunc tristique non",'
'                "body": "Donec aliquet massa et ante mollis scelerisque. In scelerisque enim non pretium cursus. Nullam ullamcorper hendrerit enim id faucibus. Mauris justo orci, malesuada ultricies tellus et, pellentesque efficitur purus. Integer vehicula facilisis augue, vel volutpat risus lobortis et. Donec feugiat mauris in euismod condimentum. Proin sed ipsum et mi suscipit luctus quis sed ex. Donec eu nunc ac enim tristique tempor quis a purus."'
'            },'
'            {'
'                "header": "Sed id nunc et erat blandit porttitor",'
'                "body": "Mauris semper interdum metus pretium scelerisque. Nulla facilisi. Cras in tellus ut nibh auctor lobortis vitae a dui. Vestibulum convallis mollis tristique. Morbi arcu sapien, sagittis sed viverra eu, posuere id tellus. Maecenas feugiat nisi in metus tincidunt aliquam."'
'            },'
'            {'
'                "header": "Mauris ac libero velit",'
'                "body": "Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas placerat orci a sagittis scelerisque. Maecenas nulla ipsum, auctor eu sollicitudin sollicitudin, congue non est. Donec vel gravida tortor, a ullamcorper purus. Praesent vehicula risus velit, facilisis aliquam enim placerat vel. Vivamus efficitur purus vitae orci sagittis, eu luctus nisl aliquam. Maecenas tristique ex in luctus elementum. Aenean elementum tempus ante, ac laoreet magna fermentum quis. Aliquam interdum dolor et scelerisque sagittis. Pellentesque non condimentum quam. Suspendisse a elit pretium, porttitor nibh a, vulputate elit."'
'            },'
'            {'
'                "header": "Vivamus dictum ante et pulvinar euismod",'
'                "body": "Aliquam et porttitor nisi. Sed feugiat ut quam feugiat congue. Sed ultricies pellentesque tellus, vitae vehicula metus. Morbi non nulla vehicula, congue magna in, consectetur dui. Morbi convallis velit augue, quis condimentum sem ultrices vitae. Maecenas cursus nibh nec magna lacinia, vel porttitor urna blandit. Etiam id iaculis massa. Aenean metus ipsum, congue at dolor sit amet, ornare gravida tellus. Curabitur ut sapien quis ipsum tempor ullamcorper eu eu dolor. Mauris bibendum magna placerat leo finibus auctor. Aliquam vel nibh finibus, tempus ex et, pellentesque odio. Aenean id tellus id nulla malesuada bibendum ut quis nunc. Fusce semper facilisis magna at eleifend."'
'            },'
'            {'
'                "header": "Nullam eget sem commodo, finibus urna non, tempus sem",'
'                "body": "Donec lorem sem, sollicitudin nec porta sit amet, convallis quis metus. Donec sodales, orci vel gravida rhoncus, orci sem sollicitudin velit, vel hendrerit lorem ligula in ligula. Proin quis ullamcorper sem, sed fringilla purus. Praesent hendrerit a purus sit amet pharetra. Phasellus efficitur accumsan nisl, auctor volutpat magna dapibus quis. In hac habitasse platea dictumst. Nulla lacinia sodales nisi nec lobortis. Cras venenatis vehicula arcu, ut ultrices velit commodo a. Nullam ac interdum erat. Praesent dictum odio consectetur odio porta pellentesque."'
'            }'
'        ]'
'    }'
'}';

const appContactData = 
'{'
'    "header_1": "Where can I get some?",'
'    "header_2": "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.",'
'    "addressHeader": "Address",'
'    "address": "City name\\nstreet Jkjadkavnlsjpoiaj, building 634, office 2",'
'    "contactHeader": "Lorem ipsum dolor",'
'    "contact": "Contact emailaddress here\\nContact phone here",'
'    "imageMap": "assets/images/addressMap.png"'
'}';

const webYandexMap = 
'''
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Быстрый старт. Размещение интерактивной карты на странице</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://api-maps.yandex.ru/2.1/?apikey=59bd617b-ccf1-484a-9403-777642f03929&lang=ru_RU" type="text/javascript">
    </script>
    <script type="text/javascript">
        
        ymaps.ready(init);

        function init(){
            var myMap = new ymaps.Map("map", {
                center: [55.76, 37.64],
                zoom: 12
            });
        
            myMap.geoObjects.add(new ymaps.Placemark([55.76, 37.64], {
                balloonContent: '<strong>Lorem Ipsum</strong>',
                iconContent: 'LI'
            }, {
                preset: 'islands#pinkStretchyIcon',
                // iconColor: '#f185b2'
            }));        
        }
    </script>

    <style>
          html, body, #map {
              width: 100%; height: 100%; padding: 0; margin: 0;
          }
    </style>

</head>

<body>
    <div id="map"></div>
</body>

</html>
''';
