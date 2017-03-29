// 推荐标签
(function(){
	var str = ['+', '-']
	$('.form-horizontal .btn_add_tech').click(function(){
		var $this = $(this),$con = $('#mycard-plus');

		if($this.html() == '-'){
			$this.html(str[0]);
			$('.form-horizontal .btn_add_tech').removeClass('btn_close');
			$('.form-horizontal .btn_add_tech').addClass('btn_open');
            $('.main-content').css('height', '1100');
			$con.hide();
		}else{
			$this.html(str[1]);
			$('.form-horizontal .btn_add_tech').removeClass('btn_open');
			$('.form-horizontal .btn_add_tech').addClass('btn_close');

			$('.main-content').css('height', '1340px');
			$con.show();
		}
	});

	$('.default-tag a').on('click', function(){
		var $this = $(this),
				name = $this.attr('title'),
				id = $this.attr('value');
		setTips(name, id);
	});
	//手动贴上标签
$('#add-on_btn .add-on_btn').on('click', function(){
		//var $this = $(this).prev();
			//	name = $this.attr('title'),
		id  = $('#skill_tab').val();
		$('#skill_tab').val('');
		if(id.length>0){
			name=id;
			setTips(name, id);
		}	
	});
	// 更新高亮显示
	setSelectTips = function(){
		var arrName = getTips();
		if(arrName.length){
			$('#myTags').show();
		}else{
			$('#myTags').hide();
		}
		$('.default-tag a').removeClass('selected');
		$.each(arrName, function(index,name){
			$('.default-tag a').each(function(){
				var $this = $(this);
				if($this.attr('title') == name){
					$this.addClass('selected');
					return false;
				}
			})
		});
	}

})();
// 更换链接
(function(){
	var $b = $('#change-tips'),
		$d = $('.default-tag div'),
		len = $d.length,
		t = 'nowtips';
	$b.click(function(){
		var i = $d.index($('.default-tag .nowtips'));
		i = (i+1 < len) ? (i+1) : 0;
		$d.hide().removeClass(t);
		$d.eq(i).show().addClass(t);
	});
	$d.eq(0).addClass(t);
})();

$(function(){(
	function(){		
		var a = $(".plus-tag");
		
		hasTips=function(b){
			var d=$("a",a),c=false;
			d.each(function(){
				if($(this).attr("title")==b){
					c=true;
					return false
				}
			});
			return c
		};

		isMaxTips=function(){
			return	($("a",a).length>=G_tocard_maxTips) ;
		};

		setTips=function(c,d){
			if(hasTips(c)){
				return false
			}if(isMaxTips()){
				alert("最多添加"+G_tocard_maxTips+"个标签！");
				return false
			}
			var b=d?'value="'+d+'"':"";
			a.append($("<a "+b+' title="'+c+'" href="javascript:void(0);" ><span>'+c+"</span><em></em></a>"));
			
			$("a em",a).on("click",function(){
				var e=$(this).parents("a"),f=e.attr("title"),g=e.attr("value");
				delTips(f,g);
			});
			
			searchAjax(c,d,true);
			return true
		};

		delTips=function(b,c){
			if(!hasTips(b)){
				return false
			}
			$("a",a).each(function(){
				var d=$(this);
				if(d.attr("title")==b){
					d.remove();
					return false
				}
			});
			searchAjax(b,c,false);
			return true
		};

		getTips=function(){
			var b=[];
			$("a",a).each(function(){
				b.push($(this).attr("title"))
			});
			return b
		};

		getTipsId=function(){
			var b=[];
			$("a",a).each(function(){
				b.push($(this).attr("value"))
			});
			return b
		};
		
		getTipsIdAndTag=function(){
			var b=[];
			$("a",a).each(function(){
				b.push($(this).attr("value")+"##"+$(this).attr("title"))
			});
			return b
		}
	}
	
)()});

var searchAjax=function(){};
var G_tocard_maxTips=5;

$(function(){
	setSelectTips();
	$('.plus-tag').append($('.plus-tag a'));
});
var searchAjax = function(name, id, isAdd){
	setSelectTips();
};

function makeTabs(){
	var i = 0;
	var tabStr = '';
	$("#myTags a").each(function(){
		var title = $(this).attr('title');
		if ( title != '' ){
			if (i > 0 ) {
				tabStr += ',';
			}
			tabStr += title;
			i++;
		}
	});
	$('#tabstrings').val(tabStr);
}