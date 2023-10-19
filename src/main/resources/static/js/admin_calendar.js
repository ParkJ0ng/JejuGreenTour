

let setstr=0;

function resetStar(){
    setStar=0;
    alert(setStar);
    }
function setStar(){
++setStar;
alert(setStar)
}


function randomColor()  {
    let color_r = Math.floor(Math.random() * 127 + 128).toString(16);
    let color_g = Math.floor(Math.random() * 127 + 128).toString(16);
    let color_b = Math.floor(Math.random() * 127 + 128).toString(16);
    return `#${color_r+color_g+color_b}`;
  }

  function subCodesSetColor(){
      let subCodes=[];
  document.querySelectorAll('.subCodes').forEach(element => {
    subCodes[element.value]=randomColor();
  });
    return subCodes;
  }


document.addEventListener('DOMContentLoaded', function () {
    let subCodes=[];
    subCodes = subCodesSetColor();

    let reservationCode=document.querySelectorAll('.reservationCode'); 
    let subCode = document.querySelectorAll('.subCode');
    let sta = document.querySelectorAll('.start');
    let en = document.querySelectorAll('.end');
    let dayuse = document.querySelectorAll('.dayuse');
    let memberName = document.querySelectorAll('.memberName');
    let reservationDate = document.querySelectorAll('.reservationDate');
    let price = document.querySelectorAll('.price');

        console.log(subCode['001']);
        console.log(subCode['002']);
        console.log(subCode['003']);
        console.log(subCode['004']);
        console.log(subCode['005']);
    


 var eventsss = []
    for (let i = 0; i < sta.length; i++) {

        eventsss.push({
            id: "결제일시"+reservationDate[i].value
            + '\n'+"결제금액"+price[i].value +'\n'+ memberName[i].value+"",
            title: subCode[i].value,
            start: sta[i].value,
            end: en[i].value,
            backgroundColor: subCodes[subCode[i].value],
            textColor: 'black',
            myclass1 : reservationCode[i].value
        })
    }
    var calendarEl = document.getElementById('calendar');
    let dd=10;
    var calendar = new FullCalendar.Calendar(calendarEl, {
        events: eventsss,
        initialView: 'timeGrid2WeekDay',
       views: {
            timeGrid2WeekDay: {
            type: 'dayGrid',
            duration: { days: 14 },
            buttonText: '2 week'
          }
        },
        // views: { option을 각각 따로 줄 수있다
        //     dayGrid: {
        //       // options apply to dayGridMonth, dayGridWeek, and dayGridDay views
        //     },
        //     timeGrid: {
        //       // options apply to timeGridWeek and timeGridDay views
        //     },
        //     week: {
        //       // options apply to dayGridWeek and timeGridWeek views
        //     },
        //     day: {
        //       // options apply to dayGridDay and timeGridDay views
        //     }
        //   }
        // ,
        headerToolbar: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridWeek,timeGrid2WeekDay' // user can switch between the two
        },
        dayMaxEvents: true,
        // 기타 옵션 설정 및 이벤트 데이터 로드
        selectable: true, // 날짜 선택 가능하도록 설정
        select: function (info) {
            // 선택한 날짜 범위 가져오기
            var startDate = info.startStr;
            var endDate = info.endStr;
            // 이벤트 객체 생성
            var event = {
                title: '예약', // 이벤트 제목
                start: startDate+'T'+'00:'+(++dd)+':00', // 시작 날짜
                end: endDate, // 끝나는 날짜
                backgroundColor: 'black', // 배경색 설정
            };
            // 이벤트 추가
            calendar.addEvent(event);

            // 선택 영역 초기화
            calendar.unselect();
        },
        eventClick: function (info) {
            console.log(info.event.myclass1)
            if (confirm(info.event.id+'님의'
                 + '\n' + '예약을 취소시키겠습니까?')) {
                info.event.remove()
            }
        }
    });

    calendar.render();
});
