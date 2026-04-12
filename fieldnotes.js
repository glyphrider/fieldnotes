function loadToday() {
	var date = new Date();
	var month = (date.getMonth()+1).toString().padStart(2,'0');
	var day = date.getDate().toString().padStart(2,'0');
	console.log("Month = ",month);
	console.log("Day = ", day);
	let img_tag = document.createElement('IMG');
	img_tag.setAttribute('src',`images/${month}${day}.png`);
	img_tag.addEventListener('load', () => document.getElementById('nav').classList.remove('hidden'));
	document.getElementById('guide').appendChild(img_tag);
};
function goBack() {
	window.history.back() || window.close();
};
