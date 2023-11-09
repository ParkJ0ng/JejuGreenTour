var calendar = null;




document.addEventListener('DOMContentLoaded', function () {
    let itemdetail = document.querySelectorAll('.itemdetail');
    var calendarEl = document.getElementById('calendar');

    let cantstr = document.querySelector('input[ name="reservStartday" ] ');
    let cantend = document.querySelector('input[ name="reservEndday"] ');
    console.log(cantend)
    calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'timeGridWeek,listWeek2,dayGridMonth'
        },
        visibleRange: {
            start: cantstr.value,
            end: cantend.value
        },
        views: {
            listWeek2: {
                type: 'listWeek',
                duration: { days: 14 },
                buttonText: '2 week'
            }
        },
        events: [{
            id: 'notevent',
            start: '2022-' + cantstr.value.split('-')[1] + '-' + cantstr.value.split('-')[2],
            end: cantstr.value,
            overlap: false,
            display: 'background',
            color: '#ff9f89'
        }, {
            id: 'notevent',
            start: cantend.value,
            end: '2024-' + cantend.value.split('-')[1] + '-' + cantend.value.split('-')[2],
            overlap: false,
            display: 'background',
            color: '#ff9f89'
        },
        {
            id: 'notevent',
            groupId: 'Breakfast',
            startTime: '06:00:00', // a start time (10am in this example)
            endTime: '09:00:00', // an end time (6pm in this example)
            backgroundColor: 'red',//각 식사 관광 이벤트 색을 탁하게 
            display: 'background',
        },
        {
            id: 'notevent',
            groupId: 'Lunch',
            startTime: '12:00:00', // a start time (10am in this example)
            endTime: '15:00:00', // an end time (6pm in this example)
            backgroundColor: 'green',//각 식사 관광 이벤트 색을 탁하게 
            display: 'background',
        },
        {
            id: 'notevent',
            groupId: 'Dinner',
            startTime: '18:00:00', // a start time (10am in this example)
            endTime: '23:00:00', // an end time (6pm in this example)
            backgroundColor: '#000066',//각 식사 관광 이벤트 색을 탁하게 
            display: 'background',
        },
        {
            id: 'notevent',
            groupId: 'tour1',
            startTime: '09:00:00', // a start time (10am in this example)
            endTime: '12:00:00', // an end time (6pm in this example)
            backgroundColor: '#663300',//각 식사 관광 이벤트 색을 탁하게 
            display: 'background',
        },
        {
            id: 'notevent',
            groupId: 'tour2',
            startTime: '15:00:00', // a start time (10am in this example)
            endTime: '18:00:00', // an end time (6pm in this example)
            backgroundColor: '#663300',//각 식사 관광 이벤트 색을 탁하게 
            display: 'background',
        },
        ],
        //   initialDate: '2023-01-12', today
        editable: true,
        selectable: true,
        eventDrop: function (info) {
            let setday = info.event.start.getFullYear();
            if (Number(info.event.start.getMonth()) / 10 < 1) {
                setday += "-0"
                setday += (info.event.start.getMonth() + 1)
            }
            else {
                setday += '-' + (Number(info.event.start.getMonth()) + 1)
            }
            if (Number(info.event.start.getDate()) / 10 < 1) {
                setday += "-0"
                setday += info.event.start.getDate();
            } else {
                setday += '-' + Number(info.event.start.getDate())
            }
            // console.log(document.querySelector(`a[class="${info.event.id} ${info.event.constraint}]"`))//.className.replace(info.event.startday,startday)

            info.event.setProp('id', setday + '/' + info.event.id.split('/')[1]);
            console.log(info.event)


        },
        // eventResize: function (info) {
        // },
        select: function (arg) {
            let startday = arg.start.getFullYear();
            if (Number(arg.start.getMonth()) / 10 < 1) {
                startday += "-0"
                startday += (arg.start.getMonth() + 1)
            }
            else {
                startday += '-' + (Number(arg.start.getMonth()) + 1)
            }
            if (Number(arg.start.getDate()) / 10 < 1) {
                startday += "-0"
                startday += arg.start.getDate();
            } else {
                startday += '-' + Number(arg.start.getDate())
            }

            if (startday + 'T00:00:00' >= cantstr.value + 'T00:00:00' && startday + 'T00:00:00' < cantend.value + 'T00:00:00') {



                if (confirm(arg.start.getFullYear() + ':' + arg.start.getMonth() + ':' + arg.start.getDate() + ' 에 일정을 추가 하시겠습니까?')) {
                    let events = calendar.getEvents().forEach(element => {
                        if (element.id.split('/')[0] == startday) {
                            element.remove();
                        }
                    });


                    for (let i = 0; i < 5; i++) {
                        if (itemdetail[i].dataset.name == " ") {
                        } else {

                            switch (i) {
                                case 0:
                                    calendar.addEvent({
                                        id: startday + '/' + itemdetail[i].dataset.addr.replace(/ /g, '_'),
                                        title: itemdetail[i].dataset.name,
                                        start: (startday + 'T08:00:00'),
                                        end: (startday + 'T09:00:00'),
                                        constraint: 'Breakfast'
                                    })
                                    break;
                                case 1:
                                    calendar.addEvent({
                                        id: startday + '/' + itemdetail[i].dataset.addr.replace(/ /g, '_'),
                                        title: itemdetail[i].dataset.name,
                                        start: (startday + 'T09:00:00'),
                                        end: (startday + 'T10:00:00'),
                                        constraint: 'tour1'
                                    })
                                    break;
                                case 2:
                                    calendar.addEvent({
                                        id: startday + '/' + itemdetail[i].dataset.addr.replace(/ /g, '_'),
                                        title: itemdetail[i].dataset.name,
                                        start: (startday + 'T12:00:00'),
                                        end: (startday + 'T13:00:00'),
                                        constraint: 'Lunch'
                                    })

                                    break;
                                case 3:
                                    calendar.addEvent({
                                        id: startday + '/' + itemdetail[i].dataset.addr.replace(/ /g, '_'),
                                        title: itemdetail[i].dataset.name,
                                        start: (startday + 'T15:00:00'),
                                        end: (startday + 'T16:00:00'),
                                        constraint: 'tour2'
                                    })

                                    break;

                                default:
                                    calendar.addEvent({
                                        id: startday + '/' + itemdetail[i].dataset.addr.replace(/ /g, '_'),
                                        title: itemdetail[i].dataset.name,
                                        start: (startday + 'T18:00:00'),
                                        end: (startday + 'T19:00:00'),
                                        constraint: 'Dinner'
                                    })
                                    break;
                            }
                            itemdetail[i].dataset.check = 'N'
                            itemdetail[i].dataset.name = " "
                            itemdetail[i].dataset.addr = " "
                            itemdetail[i].querySelector('.name').innerHTML = ""
                            itemdetail[i].querySelector('.addr').innerHTML = ""
                        }
                    }
                }
                calendar.unselect()
            }
        },
        eventClick: function (arg) {
            if (confirm('Are you sure you want to delete this event?')) {
                console.log(arg.el.classList[6])
                console.log(arg.event.title)
            }
        }
    })

    calendar.render();
});



let allplan = [];
function aaaaa() {


    let cantstr = document.querySelector('input[ name="reservStartday" ] ');
    let cantend = document.querySelector('input[ name="reservEndday"] ');
    //fc-list 때는 안되게
    // console.log(calendar.getEvents())
    let events = [];
    calendar.getEvents().forEach(element => {
        if (element.id != 'notevent') {
            events.push({
                startday: element.id.split('/')[0],
                title: element.title,
                addr: element.id.split('/')[1],
                start: element.start.getHours() + ':' + element.start.getMinutes(),
                end: element.end.getHours() + ':' + element.end.getMinutes(),
                constraint: element.constraint
            })
        }
    });
    document.querySelector('button[title="2 week view"]').click();

    console.log(((new Date(cantend.value)).getTime()-(new Date(cantstr.value)).getTime())/(1000*60*60*24)+1)
    for (let i = 0; i <((new Date(cantend.value)).getTime()-(new Date(cantstr.value)).getTime())/(1000*60*60*24)+1 ; i++) {
        allplan[i]={
            planIdx: i,
            breakfastName:null,
            breakfastAddr:null,
            breakfastTime:null,
            pointoneName:null,
            pointoneAddr:null,
            pointoneTime:null,
            lunchName:null,
            lunchAddr:null,
            lunchTime:null,
            pointtwoName:null,
            pointtwoAddr:null,
            pointtwoTime:null,
            dinnerName:null,
            dinnerAddr:null,
            dinnerTime:null,

        }
    }
    events.forEach(element => {
        let index = ((new Date(element.startday)).getTime() - (new Date(cantstr.value)).getTime()) / (1000 * 60 * 60 * 24);
        allplan[index].planDate=element.startday;
        switch (element.constraint) {
            case 'Breakfast':
                console.log(allplan)
                allplan[index].breakfastName = element.title
                allplan[index].breakfastAddr = element.addr
                allplan[index].breakfastTime = element.startday +' '+ element.start + '/' + element.startday +' '+ element.end;
                break;
            case 'tour1':
                allplan[index].pointoneName = element.title
                allplan[index].pointoneAddr = element.addr
                allplan[index].pointoneTime = element.startday +' '+ element.start + '/' + element.startday +' '+ element.end;
                break;
            case 'Lunch':
                allplan[index].lunchName = element.title
                allplan[index].lunchAddr = element.addr
                allplan[index].lunchTime = element.startday +' '+ element.start + '/' + element.startday +' '+ element.end;
                break;
            case 'tour2':
                allplan[index].pointtwoName = element.title
                allplan[index].pointtwoAddr = element.addr
                allplan[index].pointtwoTime = element.startday +' '+ element.start + '/' + element.startday +' '+ element.end;
                break;
            default:
                allplan[index].dinnerName = element.title
                allplan[index].dinnerAddr = element.addr
                allplan[index].dinnerTime = element.startday +' '+ element.start + '/' + element.startday +' '+ element.end;
                break;
        }
    })
    console.log(allplan);
}

