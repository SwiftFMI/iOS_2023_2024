//
//  Model.swift
//  AdventsCalendar
//
//  Created by Emil Atanasov on 12/14/23.
//

import Foundation

/// Изброим тип, който определя различните видове дни в календара.
enum WeekDay {
    /// Работен ден
    case workday
    /// Почивен ден
    case weekend
    /// Празничен почивен ден
    case holiday
}

extension Date {
    var weekDay: WeekDay {
        // помощни функции
        func isWeekend(weekday: Int) -> Bool {
            return weekday == 0 || weekday == 6
        }
        
        func weekday(date: Date) -> Int {
           return Calendar.current.component(.weekday, from: date) - 1
        }
        
        return isWeekend(weekday: weekday(date: self)) ? .weekend : .workday
    }
}

/// Структура, календарен ден. Представя един ден от календара и типът ден.
class CalendarDay {
    /// дата, която уникално определя един ден от календара
    var date: Date
    /// изчислимо пропърти, което на базата на датата и официалните празници определя,
    /// дали даден ден е почивен или не. Всички дни от уикенда (събота и неделя) са почивни.
    /// Всички официални празници са празнични почивни дни. Ако празник се падне в неделя
    /// тогава и понеделникът от следващата седмица е празнично почивен.
    var type: WeekDay
    /// Списък със задачи
    var tasks: [TaskItem] = []
    var gift: Gift
    
    init(date: Date, type: WeekDay, tasks: [TaskItem], gift: Gift) {
        self.date = date
        self.type = type
        self.tasks = tasks
        self.gift = gift
    }
}

extension CalendarDay: Identifiable {
    var id: Date { date }
}

extension CalendarDay {
    /// към кой месец се отнася текущия ден
    var month: Int {
        return date.month
    }
}

/// Структура, която представя задача.
struct TaskItem {
    /// Име на задачата
    var title: String
    /// Описание на задачата
    var description: String = ""
    /// Дали задачата е изпълнена
    var isComplete: Bool
    let id = UUID()
}

extension TaskItem: Identifiable {
    
}


/// Структура, която представя един видео файл.
struct Gift {
    var title: String
    var image: String
    let id = UUID()
}


extension Gift: Identifiable {
    
}

/// Изберете правилната реализация на view-model-а
/// Ако е необходимо може да промените типа от struct на class

/// Тестови данни може да намерите тук

extension CalendarDay {
    static var mocks: [CalendarDay] {
        var days = [CalendarDay]()
        
        let dec1 = Calendar.current.date(from: DateComponents(timeZone: TimeZone(identifier: "GMT"), year: 2023, month: 12, day: 1, hour: 0, minute: 0, second: 0, nanosecond: 0))!
        func isMonday(weekday: Int) -> Bool {
            return weekday == 1
        }
        
        func isWeekend(weekday: Int) -> Bool {
            return weekday == 0 || weekday == 6
        }
        
        func weekday(date: Date) -> Int {
           return Calendar.current.component(.weekday, from: date) - 1
        }
        
        // намираме датата, която е в понеделник на първата седмица
        var startDate = dec1

        while startDate.dateInMonth <= 24 {
            let type = isWeekend(weekday: weekday(date: startDate)) ? WeekDay.weekend : WeekDay.workday
            let day = CalendarDay(date: startDate, type: type, tasks: TaskItem.getTasks(), gift: Gift.mock)
            days.append(day)
            
            startDate = startDate.dayAfter
            // стигнали сме края на седмицата, минаваме на следващата
        }

        return days
    }
}

extension Gift {
    private static var gifts: [String] {
        ["🍏", "⌚️", "📱", "📷", "🎙️", "⏰", "🚜", "🍼", "🍯" , "🎅"]
    }
    
    static var mock: Gift {
        Gift(title: "Коледен подарък", image: randomItem(from: Gift.gifts))
    }
}

extension TaskItem {
    private static var numberOfTasks: [Int] {
        [1, 2, 3]
    }
    
    private static var tasks: [String] {
        ["Направи домашен сладолед!",
         "Нарисувай семейна картина!",
         "Подреди си стаята!",
         "Снимай се с приятел!",
         "Нахрани птичките навън!",
         "Напиши си домашните!",
         "Разходи се с приятели!",
         "Реди LEGO с приятел!",
         "Научи за изпита по Геометрия!",
         "Празнувай с 🎅",
         "Окраси коледното дърво!",
         "Отиди на фризьор/маникюр!",
         "Отиди в зоологическата градина!",
         "Играй компютърна игра днес!",
         "Играй с приятели на настолна игра!"
        ]
    }
    
    static var mock: TaskItem {
        TaskItem(title: randomItem(from: tasks), isComplete: false)
    }
    
    static func getTasks() -> [TaskItem] {
        
        var numberOfTasks = randomItem(from: numberOfTasks)
        var tasks = [TaskItem]()
        while numberOfTasks > 0 {
            numberOfTasks -= 1
            let task = TaskItem.mock
            tasks.append(task)
        }
        return tasks
    }
}


func randomItem<T>(from:[T]) -> T {
    let index = Int(arc4random_uniform(UInt32(from.count)))
    return from[index]
}
