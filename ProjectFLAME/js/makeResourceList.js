function makeResourceList(view){
	var obj = eval("(" + pdf + ")");
	var length = obj.pdfs.length;
	var rows = length/4;
	var html = '';
	if (length%4 != 0) rows = rows + 1;
	if (view == 'grid'){
		for(i=0; i<length; i++){
			linkBefore = "resources/pdf/" + obj.pdfs[i].id;
			if(i%4 == 0){
				html += '<div class="row">\n';
			}
			html += '<div class="col-md-3">\n';
			html += '<div class="pdf-grid">\n';
			html += '<img class="img-thumbnail col-md-12" src="';
			html += linkBefore;
			html += '.jpg';
			html += '"/>\n';
			html += '<h6>';
			html += obj.pdfs[i].title;
			html += '</h6>\n';
			html += '<p>';
			html += obj.pdfs[i].intro;
			html += "</p>\n"
			html += '<button onClick="window.open(\'pdfview.html?pdfid=';
			html += obj.pdfs[i].id;
			html += '\')" class="btn btn-danger">View</button>';
			html += '<a class="btn" href="';
			html += linkBefore;
			html += '.pdf';
			html += '" download="'
			html += obj.pdfs[i].title;
			html += '.pdf';
			html += '">Download</a>\n';
			html += '</div>\n</div>\n';
			if(i%4 == 3){
				html += '</div>\n';
			}
		}
	}
	if(view == 'list'){
		html += '<ul>';
		for(i=0; i<length; i++){
			linkBefore = "resources/pdf/" + obj.pdfs[i].id;
			html += '<li>';
			html += obj.pdfs[i].title;
			html += '   <a href="';
			html += linkBefore;
			html += '.pdf';
			html += '" download="';
			html += obj.pdfs[i].title;
			html += '.pdf';
			html += '">download</a>   <a href="';
			html += 'pdfview.html?pdfid=';
			html += obj.pdfs[i].id;
			html += '" target="_blank">view</a></li>'
		}
		html += '</ul>';
	}
	
	return html;
};

function toggleView(view){
	if(view == "list"){
		if(viewNow == 'list');
		else{
			$('#list-btn').addClass('active');
			$('#grid-btn').removeClass('active');
			document.getElementById('gridContainer').innerHTML = makeResourceList('list');
			viewNow = 'list';
			var api = $.data( $('#liquid-slider-resources')[0], 'liquidSlider');
			api.adjustHeight(false, api.getHeight());
		}
	}
	if(view == 'grid'){
		if(viewNow == 'grid');
		else{
			$('#list-btn').removeClass('active');
			$('#grid-btn').addClass('active');
			document.getElementById('gridContainer').innerHTML = makeResourceList('grid');
			viewNow = 'grid';
			var api = $.data( $('#liquid-slider-resources')[0], 'liquidSlider');
			window.setTimeout(function(){api.adjustHeight(false, api.getHeight())},300);
		}
	}
};