function updateAccomForm() {

    inputInvalidate('#updateButton');

}

function updateAccomForm1() {

    inputAddr('#updateButton1');

}

function updateAccomForm2() {

    inputInvalidate('#updateButton2');

}

function returnUpdateForm() {
    inputInvalidate2('#updateButton');
}

function returnUpdateForm1() {
    returnAddr('#updateButton1');
}

function returnUpdateForm2() {
    inputInvalidate2('#updateButton2');
}


// 회원가입에서 주소검색 버튼 클릭 시 실행
function openPost2() {
    new daum.Postcode({
        oncomplete: function (data) {
            // document.querySelector('#postCode').value = data.tesPostcode;
            let sido = data.sido;

            console.log(sido);
            if (sido != "제주특별자치도") {
                inputInvalidate3('#id-error-div2', '제주 내 업소만 등록가능!');
                return;
            }
            else {
                inputInvalidate3('#id-error-div2', '');
            }

            document.querySelector('#inputAccomAddr').value = data.roadAddress;

        }


    }
    ).open();

}

function inputInvalidate(tagId) {
    var element = document.querySelector(tagId);
    var parent = element.parentElement;
    element.style.display = 'none';
    element.nextElementSibling.style.display = 'block';
    parent.children[1].style.display = 'none';
    parent.children[2].style.display = 'block';
    parent.children[2].value = parent.children[1].textContent;
}

function inputAddr(tagId) {
    var element = document.querySelector(tagId);
    var parent = element.parentElement;
    element.style.display = 'none';
    element.previousElementSibling.style.display = 'block';
    parent.children[1].style.display = 'none';
    parent.children[2].style.display = 'block';
    parent.children[3].style.display = 'block';
    parent.children[2].value = parent.children[1].textContent;
    parent.children[4].style.display = 'none';
    parent.children[5].style.display = 'block';
    parent.children[5].value = parent.children[4].textContent;
    parent.children[7].style.display = 'block';
}

function returnAddr(tagId) {
    var element = document.querySelector(tagId);
    var parent = element.parentElement;
    element.style.display = 'none';
    element.previousElementSibling.style.display = 'block';
    parent.children[1].style.display = 'block';
    parent.children[2].style.display = 'none';
    parent.children[1].textContent = parent.children[2].value;
    parent.children[3].style.display = 'none';
    parent.children[4].style.display = 'block';
    parent.children[4].textContent = parent.children[5].value;
    parent.children[5].style.display = 'none';
    parent.children[6].style.display = 'block';
    parent.children[7].style.display = 'none';
}


function inputInvalidate2(tagId) {
    var element = document.querySelector(tagId);
    var parent = element.parentElement;
    element.style.display = 'none';
    element.previousElementSibling.style.display = 'block';
    parent.children[1].style.display = 'block';
    parent.children[1].textContent = parent.children[2].value;
    parent.children[2].style.display = 'none';
    parent.children[3].style.display = 'block';
    parent.children[4].style.display = 'none';
}




function updateMainAccomName(accomCode, accomName, accomIntro) {
    fetch('/accom/updateMainAccomName', { //요청경로
        method: 'POST',
        cache: 'no-cache',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
        },
        //컨트롤러로 전달할 데이터
        body: new URLSearchParams({
            'accomCode': accomCode,
            'accomName': accomName,
            'accomIntro': accomIntro,
            'inputMainAccomName': document.querySelector('#inputAccomName').value,
            'inputMainAccomIntro': document.querySelector('#inputAccomIntro').value
        })
    })
        .then((response) => {
            if (!response.ok) {
                alert('fetch error!\n컨트롤러로 통신중에 오류가 발생했습니다.');
                return;
            }

            return response.text(); //컨트롤러에서 return하는 데이터가 없거나 int, String 일 때 사용
            //return response.json(); //나머지 경우에 사용
        })
        //fetch 통신 후 실행 영역
        .then((data) => {//data -> controller에서 리턴되는 데이터!
            alert('업소의 상태가 변경되었습니다.')

        })
        //fetch 통신 실패 시 실행 영역
        .catch(err => {
            alert('fetch error!\nthen 구문에서 오류가 발생했습니다.\n콘솔창을 확인하세요!');
            console.log(err);
        });

}

function updateMainAccomAddr(accomCode) {
    fetch('/accom/updateMainAccomAddr', { //요청경로
        method: 'POST',
        cache: 'no-cache',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
        },
        //컨트롤러로 전달할 데이터
        body: new URLSearchParams({
            'accomCode': accomCode,
            'inputAccomAddr': document.querySelector('#inputAccomAddr').value,
            'inputAddrDetail': document.querySelector('#inputAddrDetail').value
        })
    })
        .then((response) => {
            if (!response.ok) {
                alert('fetch error!\n컨트롤러로 통신중에 오류가 발생했습니다.');
                return;
            }

            return response.text(); //컨트롤러에서 return하는 데이터가 없거나 int, String 일 때 사용
            //return response.json(); //나머지 경우에 사용
        })
        //fetch 통신 후 실행 영역
        .then((data) => {//data -> controller에서 리턴되는 데이터!
            alert('업소의 상태가 변경되었습니다.')

        })
        //fetch 통신 실패 시 실행 영역
        .catch(err => {
            alert('fetch error!\nthen 구문에서 오류가 발생했습니다.\n콘솔창을 확인하세요!');
            console.log(err);
        });

}

function inputInvalidate3(tagId, message) {
    document.querySelector(tagId).style.display = 'block';
    document.querySelector(tagId).textContent = message;
}

$('.mainAccomSubImg').slick({
    arrows: false,
    variableWidth: true,
    infinite: false,
});

function addsubImg(tag, accomCode) {
    const form = new FormData();
    // console.log(tag.files);


    for (let a of tag.files) {
        form.append('files', a);
    }
    form.append('accomCode', accomCode);








    // ------------------- 두번째 방식(가장 많이 쓰는 방식) ---------------//
    fetch('/accom/updateMainAccomSubImg', { //요청경로
        method: 'POST',
        cache: 'no-cache',
        headers: {
            //'Content-Type': 'application/json; charset=UTF-8'
        },
        //컨트롤러로 전달할 데이터
        body: form

    })
        .then((response) => {
            return response.json(); //나머지 경우에 사용
        })
        //fetch 통신 후 실행 영역
        .then((data) => {//data -> controller에서 리턴되는 데이터!
            alert('업소의 상태가 변경되었습니다.')
            // console.log(data);
            console.log(data)


            var slicktrack = document.querySelector('.slick-track');


            for (const data1 of data) {
                var imageListSlide = document.createElement("div");
                imageListSlide.className = "imgListSlide slick-slide";

                var imgElement = document.createElement("img");
                imgElement.className = "imgSlideList";
                imgElement.src = '/img/accom/' + data1.attachedFileName;
                imgElement.alt = '';

                var inputElement = document.createElement("input");
                inputElement.type = "hidden";
                inputElement.name = "mainAccomImgCode";
                inputElement.value = data1.mainImgCode;

                var deleteButton = document.createElement("div");
                deleteButton.className = "deletebutton";
                deleteButton.innerHTML = '<span>X</span>';
                deleteButton.addEventListener('click', function () {
                    deleteSubImg(data1.mainImgCode, data1.accomCode)})
            
                imageListSlide.appendChild(imgElement);
                imageListSlide.appendChild(inputElement);
                imageListSlide.appendChild(deleteButton);
                slicktrack.appendChild(imageListSlide);




            };


        })
        //fetch 통신 실패 시 실행 영역
        .catch(err => {
            alert('fetch error!\nthen 구문에서 오류가 발생했습니다.\n콘솔창을 확인하세요!');
            console.log(err);
        });

}

function deleteSubImg(mainImgCode, accomCode) {



    // ------------------- 첫번째 방식 ---------------//
    fetch('/accom/deleteSubImg', { //요청경로
        method: 'POST',
        cache: 'no-cache',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
        },
        //컨트롤러로 전달할 데이터
        body: new URLSearchParams({
            'mainImgCode': mainImgCode,
            'accomCode': accomCode
        })
    })
        .then((response) => {
            if (!response.ok) {
                alert('fetch error!\n컨트롤러로 통신중에 오류가 발생했습니다.');
                return;
            }

            // return response.text(); //컨트롤러에서 return하는 데이터가 없거나 int, String 일 때 사용
            return response.json(); //나머지 경우에 사용
        })
        //fetch 통신 후 실행 영역
        .then((data) => {//data -> controller에서 리턴되는 데이터!
            alert('삭제되었습니다.')

            var slicktrack = document.querySelector('.slick-track');
            slicktrack.innerHTML = "";

            var newAddSubImgElement = document.createElement('div');
            newAddSubImgElement.className = 'addSubImg slick-slide slick-current slick-active';


            var plusElement = document.createElement('div');
            plusElement.className = 'plus';

            var spanElement = document.createElement('span');
            spanElement.textContent = '+';

            var formElement = document.createElement('form');
            formElement.action = '';
            formElement.id = 'mainAccomSubImgs';
            formElement.enctype = 'multipart/form-data';

            var inputElement = document.createElement('input');
            inputElement.className = 'plusbutton';
            inputElement.type = 'file';
            inputElement.name = 'subImg';
            inputElement.multiple = true;

            inputElement.addEventListener('change', function () {
                addsubImg(this, accomCode);
            });

            formElement.appendChild(inputElement);
            plusElement.appendChild(spanElement);
            plusElement.appendChild(formElement);

            var plusTextElement = document.createElement('div');
            plusTextElement.className = 'plusText';
            plusTextElement.textContent = '사진 추가';

            newAddSubImgElement.appendChild(plusElement);
            newAddSubImgElement.appendChild(plusTextElement);
            slicktrack.appendChild(newAddSubImgElement);

            for (const data1 of data) {
                console.log(data1)
                var imageListSlide = document.createElement("div");
                imageListSlide.className = "imgListSlide slick-slide";

                var imgElement = document.createElement("img");
                imgElement.className = "imgSlideList";
                imgElement.src = '/img/accom/' + data1.attachedFileName;
                imgElement.alt = '';

                var inputElement = document.createElement("input");
                inputElement.type = "hidden";
                inputElement.name = "mainAccomImgCode";
                inputElement.value = data1.mainImgCode;

                var deleteButton = document.createElement("div");
                deleteButton.className = "deletebutton";
                deleteButton.innerHTML = '<span>X</span>';
                deleteButton.onclick = function () {
                    deleteSubImg(data1.mainImgCode, accomCode);
                };
                imageListSlide.appendChild(imgElement);
                imageListSlide.appendChild(inputElement);
                imageListSlide.appendChild(deleteButton);
                slicktrack.appendChild(imageListSlide);
                // }


            };
        })
        //fetch 통신 실패 시 실행 영역
        .catch(err => {
            alert('fetch error!\nthen 구문에서 오류가 발생했습니다.\n콘솔창을 확인하세요!');
            console.log(err);
        });
}