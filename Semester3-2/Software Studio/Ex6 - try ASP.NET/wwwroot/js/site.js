// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
var xmlhttp;
if (window.ActiveXObject) {
    xmlhttp = new ActiveXObject('Microsoft.XMLHTTP');
} else {
    xmlhttp = new XMLHttpRequest();
}
function makeGetRequest(serverPage) {
    return new Promise((resolve, reject) => {
        xmlhttp.open('GET', serverPage);
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState === 4) {
                if (xmlhttp.status == 200) {
                    resolve({ status: xmlhttp.status, message: xmlhttp.responseText });
                } else {
                    reject({ status: xmlhttp.status, message: 'error' });
                }
            }
        };
        xmlhttp.send(null);
    });
}

var storeValue = '';
function handleInputButtonOnClick(value) {
    let resultDiv = document.getElementById('result-div');
    storeValue = storeValue.concat(value);
    resultDiv.innerText = storeValue;
}
async function handleSubmitButtonOnClick() {
    let resultDiv = document.getElementById('result-div');
    try {
        const queryParams = storeValue.replaceAll('+', '%2B').replaceAll('*', '%2A').replaceAll('/', '%2F');
        const res = await makeGetRequest(`https://localhost:7177/Home/Calculate/?input=${queryParams}`);
        storeValue = res.message;
        resultDiv.innerText = storeValue;
    } catch (error) {
        storeValue = '';
        resultDiv.innerText = 'error';
    }
}
function handleClearButtonOnClick() {
    let resultDiv = document.getElementById('result-div');
    storeValue = '';
    resultDiv.innerText = storeValue;
}
