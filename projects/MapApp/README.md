# MapKit 

Днес ще говорим за лесната и бърза интеграция на карта в приложението.

Започваме с интеграцията на пакета `MapKit`. Това става със следния код:

```ѕwift=
import MapKit
```

Добре е да се запознаме с `CLLocationCoordinate2D` - структура, която представя локация на карта. Повече може да се прочете в офциалната [документация](https://developer.apple.com/documentation/corelocation/cllocationcoordinate2d).


Лесно можем да добавим карта, с `Map` компонента. 
А маркер на самата карта с:
```swift=
Map {
    Marker("ФМИ", coordinate: CLLocationCoordinate2D(latitude: 43.07545400000001, longitude: 25.606703000000017))
    Marker("ФМИ", systemImage: "graduationcap.circle" , coordinate: CLLocationCoordinate2D(latitude: 43.07545400000001, longitude: 25.606703000000017))
}
```

Можем да добавим и анотации по самата карта, която ни позволява да изобразим `SwiftUI` компонент.

```swift=
Map {
    Annotation("ФМИ", coordinate: CLLocationCoordinate2D(latitude: 43.07545400000001, longitude: 25.606703000000017), anchor: .bottom) {
     Image(systemName: "graduationcap.circle")
        .padding(10)
        .foregroundStyle(.white)
        .background(Color.purple)
        .cornerRadius(10)
    }
}
```

Можем да изпозлваме и основни примитиви за обозначаване на площ или маршрут по саматата карта.

```swift=
Map {
    MapCircle()
}
```
