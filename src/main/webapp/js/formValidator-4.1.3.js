//====================================================================================================
// [插件名称] jQuery formValidator
//----------------------------------------------------------------------------------------------------
// [描    述] jQuery formValidator表单验证插件，它是基于jQuery类库，实现了js脚本于页面的分离。对一个表
//            单对象，你只需要写一行代码就可以轻松实现20种以上的脚本控制。现支持一个表单元素累加很多种
//            校验方式,采用配置信息的思想，而不是把信息写在表单元素上，能比较完美的实现ajax请求。
//----------------------------------------------------------------------------------------------------
// [作者网名] 猫冬	
// [邮    箱] wzmaodong@126.com
// [作者博客] http://wzmaodong.cnblogs.com
// [插件主页] http://www.yhuan.com
// [QQ群交流] 72280458、74106519
// [更新日期] 2011-07-24
// [版 本 号] ver4.1.3 内部测试版
// [开源协议] LGPL
//====================================================================================================
var Subtype='';
var x;

$(function() {
    Subtype = $('#Subtn').attr('type');
    var x;
    $('#Subtn').click(function() {
        if($("#formID").attr('action')==='/admin/send_email/send'){
            $('#youjianneirong').val(CKEDITOR.instances.youjianneirong.getData());
        }
        var img = $('.delimg');
        if( img.length>0 ) {
            x = $(".delimg").detach();
        }
    });

if(Subtype==='button'){
    $.formValidator.initConfig({
        submitButtonID:"Subtn",
        debug:true,
        mode:'AutoTip',
        theme:"ArrowSolidBox",
        onError:function(){
            $('#Subtn').removeAttr("disabled");
            $('#Subtn').show();
            $('#spshow').hide();
            var files = $('.files b');
            if( files.length > 0 ) {
                $(".files").prepend(x);
            }},
        onSuccess:function(){
            submit();
        }
    });
}else {
    $.formValidator.initConfig({
        formID:"formID",
        theme:'ArrowSolidBox',
        mode:'AutoTip',
        onError:function() {
            $('#Subtn').removeAttr("disabled");
            $('#Subtn').show();
            $('#spshow').hide();
        },
        inIframe:true
    });

}
window.onbeforeunload = function (){
    $('#Subtn').removeAttr("disabled");
}
// 登录 用户名
$("#username").formValidator({onShow:"",onFocus:"",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"请输入您的邮箱"},onError:"请输入您的邮箱"});

$("#dengluid").formValidator({onShow:"由英文、数字、或下划线组成，至少6个字符",onFocus:"由英文、数字或下划线组成，至少6个字符",onCorrect:""})
.inputValidator({min:6,empty:{leftEmpty:false,rightEmpty:false,emptyError:"请输入账号，且前后不能有空格"},onError:"账号不能少于6个字符，请确认"})
.regexValidator({regExp:"charnum_e",dataType:"enum",onError:"账号格式不正确，请重新输入"})
.ajaxValidator({
    dataType : "json",
    async : true,
    url : "/ajaxvalidate/validate_zhanghao",
    success : function(json){
        return json.result;
    },
    buttons: $("#Subtn"),
    error: '',
    onError : "该账号已被注册，请重新输入",
    onWait : "正在对账号进行校验，请稍候"
});

$("#pwd").formValidator({onShow:"密码6-20个字符",onFocus:"请输入6-20个字符，推荐使用字母、数字或常用符号的组合密码，字母区分大小写",onCorrect:""})
.inputValidator({min:6,max:20,empty:{leftEmpty:false,rightEmpty:false,emptyError:"密码两端不能有空格"},onError:"密码6－20个字符，请重新输入"});

$("#mima").formValidator({onShow:"",onFocus:"",onCorrect:""})
.inputValidator({min:6,empty:{leftEmpty:false,rightEmpty:false,emptyError:"请输入密码，6－20个字符"},onError:"密码格式不符合要求，请重新输入"});

// 密码
$("#oldmima").formValidator({onShow:"",onFocus:"请输入当前密码",onCorrect:""})
.inputValidator({min:6,onError:"密码不能为空或格式有误，请重新输入"});

$("#password").formValidator({onShow:"请确认密码",onFocus:"请确认密码",onCorrect:""})
.inputValidator({min:6,empty:{leftEmpty:false,rightEmpty:false,emptyError:"密码两端不能有空格"},onError:"密码不得少于6个字符，请重新输入"})
.compareValidator({desID:"pwd",operateor:"=",onError:"两次密码输入不一致"});

$("#huiyuanming").formValidator({onShow:"4-20个字符组成（ 请尽量填写真实公司名或姓名 ）",onFocus:"用于前台展示，4－20个字符，注册成功后将无法随意修改",onCorrect:""})
.inputValidator({min:4,max:20,empty:{leftEmpty:false,rightEmpty:false,emptyError:"会员名两端不能有空格，请确认"},onError:"会员名格式不符合要求，请重新输入"})

$("#huiyuanmingmod").formValidator({onShow:"会员名由4－20个字符 （ 请尽量填写真实公司名或姓名 ）",onFocus:"4－20个字符",onCorrect:""})
.inputValidator({min:4,max:20,empty:{leftEmpty:false,rightEmpty:false,emptyError:"会员名两端不能有空格，请确认"},onError:"会员名不合法，请重新输入"});

// 旧密码
$("#pwd_old").formValidator({onShow:"请输入当前密码",onFocus:"密码6-20个字符",onCorrect:""})
.inputValidator({min:6,empty:{leftEmpty:false,rightEmpty:false,emptyError:"密码两端不能有空格"},onError:"密码不得少于6个字符，请重新输入"})
.ajaxValidator({
    dataType : "json",
    async : true,
    url : "/ajaxvalidate/validate_OldPwd",
    success : function(json){
        return json.result;
    },
    buttons: $("#Subtn"),
    error: "",
    onError : "密码错误，请重新输入",
    onWait : "正在对密码进行校验，请稍候"
});

// 新密码
$("#pwd_new").formValidator({onShow:"请输入新密码",onFocus:"6-20个字符，不能和旧密码及支付密码相同",onCorrect:""})
.inputValidator({min:6,empty:{leftEmpty:false,rightEmpty:false,emptyError:"新密码两端不能有空格"},onError:"密码不得少于6个字符，请重新输入"})
.ajaxValidator({
    dataType : "json",
    async : true,
    url : "/ajaxvalidate/validate_newPwd",
    success : function(json){
        return json.result;
    },
    buttons: $("#Subtn"),
// error: function(jqXHR, textStatus, errorThrown){alert("抱歉，服务器繁忙，请重试");},
    error: "",
    onError : "新密码不合法，请确保和旧密码及支付密码不同",
    onWait : "正在对新密码进行校验，请稍候"
});
// 重置密码
$("#pwdnew").formValidator({onShow:"请输入新密码",onFocus:"6-20个字符，不能和旧密码及支付密码相同",onCorrect:""})
.inputValidator({min:6,empty:{leftEmpty:false,rightEmpty:false,emptyError:"新密码两端不能有空格"},onError:"6-20个字符，请重新输入"});
$("#pwdnewck").formValidator({onShow:"请再次输入您的新密码",onFocus:"6-20个字符",onCorrect:""})
.inputValidator({min:6,empty:{leftEmpty:false,rightEmpty:false,emptyError:"重复密码两端不能有空格"},onError:"6-20个字符，请重新输入"})
.compareValidator({desID:"pwdnew",operateor:"=",onError:"两次密码输入不一致，请确认"});

// 重置支付密码
$("#pwdzhifuold").formValidator({onShow:"请输入支付密码",onCorrect:""})
.inputValidator({min:6,onError: "密码最少6个字符"});

$("#pwdzhifunew").formValidator({onShow:"请输入支付密码",onCorrect:""})
.inputValidator({min:6,onError: "密码最少6个字符"});

$("#pwdzhifunewck").formValidator({onShow:"请再次输入支付密码",onFocus:"密码最少6个字符",onCorrect:""})
.inputValidator({min:6,empty:{leftEmpty:false,rightEmpty:false,emptyError:"支付密码两端不能有空格"},onError:"密码最少6个字符，请确认"})
.compareValidator({desID:"pwdzhifunew",operateor:"=",onError:"两次密码不一致，请确认"});

$("#passwordck").formValidator({onShow:"请再次输入密码",onFocus:"密码最少6个字符",onCorrect:""})
.inputValidator({min:6,empty:{leftEmpty:false,rightEmpty:false,emptyError:"重复密码两端不能有空格"},onError:"密码最少6个字符，请确认"})
.compareValidator({desID:"pwd_new",operateor:"=",onError:"两次密码不一致，请确认"});

$("#regemail").formValidator({onShow:"用于验证身份、找回密码、接收通知与提醒等服务",onFocus:"用于验证身份、找回密码、接收通知与提醒等服务",onCorrect:""})
.regexValidator({regExp:"email",dataType:"enum",onError:"email格式不正确"})


// 验证码
$("#authcode").formValidator({onShow:"",onFocus:"请输入图片中的计算结果",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"验证码两端不能有空格"},onError:"验证码不能为空，请输入"});


$("#email").formValidator({onShow:"请输入您的email",onFocus:"请输入如:**@163.com格式",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:true,rightEmpty:true,emptyError:"email不能为空，请输入"},onError:"email不能为空，请输入"})
.regexValidator({regExp:"email",dataType:"enum",onError:"email格式不正确"});

$("#ckbox").formValidator({tipID:"ckTip",onShow:"",onFocus:"同意之后才能继续操作",onCorrect:""})
.inputValidator({min:1,onError:"同意之后才能继续操作"});


$("#telck").formValidator({empty:true,onShow:"",onFocus:"电话号码为选填项",onCorrect:""})
.regexValidator({regExp:"tel",dataType:"enum",onError:"电话号码格式不正确"});

$("#mobilck").formValidator({onShow:"请输入您的手机号码",onFocus:"手机号码必须填写",onCorrect:""})
.functionValidator({fun:checkPhone,onError:"身份证号码有误，请重新输入"});

$("#qq").formValidator({onShow:"请输入您的qq号",onFocus:"qq必须填写",onCorrect:""})
.regexValidator({regExp:"intege1",dataType:"enum",onError:"请输入正确的qq号"});

$("#zhanghaostate").formValidator({onShow:"请选择账号状态",onFocus:"账号状态为必选项",onCorrect:""})
.inputValidator({min:1,onError: "账号状态为必选项，请选择，"});

$("#huiyuantype").formValidator({onShow:"请选择会员类型",onFocus:"会员类型为必选项",onCorrect:""})
.inputValidator({min:1,onError: "会员类型为必选项，请选择"});

$("#huiyuandeg").formValidator({onShow:"请选择会员等级",onFocus:"会员等级为必选项",onCorrect:""})
.inputValidator({min:1,onError: "会员等级为必选项，请选择"});

$("#prov").formValidator({onShow:"请选择地区",onFocus:"地区为必选项",onCorrect:""})
.inputValidator({min:1,onError: "地区为必选项，请选择"});

$("#thearea").formValidator({onShow:"请选择城市",onFocus:"城市为必选项",onCorrect:"",defaultValue:""})
.inputValidator({min:1,onError: "城市为必选项，请选择"});

$("#xiangmufenlei").formValidator({onShow:"请选择项目分类",onFocus:"项目分类为必选项",onCorrect:"",defaultValue:""})
.inputValidator({min:1,onError: "项目分类为必选项，请选择"});

$("#ruanjianfenlei").formValidator({onShow:"请选择软件类别",onFocus:"软件类别为必选项",onCorrect:"",defaultValue:""})
.inputValidator({min:1,onError: "软件类别为必选项，请选择"});

$("#hangye").formValidator({onShow:"请选择行业",onFocus:"行业为必选项",onCorrect:"",defaultValue:""})
.inputValidator({min:1,onError: "行业为必选项，请选择"});

$("#renshu").formValidator({onShow:"请输入人数（正整数）",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:true,rightEmpty:true,emptyError:"人数不能为空，请输入"},onError:"人数不能为空，请输入"})
.regexValidator({regExp:"intege1",dataType:"enum",onError:"人数格式不正确"});

$("#lianxiren").formValidator({onShow:"请输入联系人",onFocus:"联系人为必填项",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"联系人两端不能有空格，请确认"},onError:"联系人不能为空，请填写"});

$("#biaoti").formValidator({onShow:"请输入标题",onFocus:"标题为必填项",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:true,rightEmpty:true,emptyError:"标题两端不能有空格，请确认"},onError:"标题不能为空，请填写"});

$("#kaifazhouqi").formValidator({onShow:"请输入开发周期（正整数）",onFocus:"开发周期为必填项",onCorrect:""})
.regexValidator({regExp:"intege1",dataType:"enum",onError:"开发周期格式不正确"});

$("#work_experience").formValidator({onFocus:"请输入真实的工作年限",onCorrect:""})
.regexValidator({regExp:"intege1",dataType:"enum",onError:"输入格式有误"});

$("#self_decription").formValidator({onFocus:"对自己能力与态度的客观评价，不得少于20个汉字",onCorrect:""})
.inputValidator({min:40,onError: "不得少于20个汉字"});

$("#baojia").formValidator({onShow:"",onFocus:"请输入合理的报价",onCorrect:""})
.regexValidator({regExp:"intege1",dataType:"enum",onError:"请输入合理的报价"});

$("#hour_baojia").formValidator({onShow:"",onFocus:"请参照评级标准填写，报价不能超出本级别区间",onCorrect:""})
.regexValidator({regExp:"intege1",dataType:"enum",onError:"输入有误"});

$("#jingbiaoyouxiaoqi").formValidator({onShow:"请选择竞标有效期",onFocus:"竞标有效期为必选项",onCorrect:"",defaultValue:""})
.inputValidator({min:1,onError: "竞标有效期为必选项，请选择"});

$("#miaoshu").formValidator({onShow:"请输入项目描述",onFocus:"描述文字不少于30个汉字",onCorrect:""})
.inputValidator({min:60,empty:{leftEmpty:true,rightEmpty:true,emptyError:"描述文字不少于30个汉字"},onError:"描述文字不少于30个汉字"});

$("#jiage").formValidator({empty:true, onShow:"",onFocus:"请输入价格（正整数）",onCorrect:""})
.regexValidator({regExp:"intege1",dataType:"enum",onError:"价格格式不正确"});

$("#payjine").formValidator({onShow:"（支付宝、财付通充值保留两位小数，电汇充值不低于10元）",onFocus:"请输入金额",onCorrect:""})
.inputValidator({min:0.01,type:"value",onError: "金额错误"});

$("#tikuanmima").formValidator({onShow:"",onFocus:"提款密码等同于支付密码",onCorrect:""})
.inputValidator({min:6,onError:"密码不能为空或格式有误"});

$("#bankname").formValidator({onShow:"请填写真实的开户行",onFocus:"请填写真实的开户行",onCorrect:""})
.inputValidator({min:4,onError: "输入有误，请填写真实的开户行地址"});

$("#bankaddress").formValidator({onShow:"请填写真实的开户行地址",onFocus:"请填写真实的开户行地址",onCorrect:""})
.inputValidator({min:4,onError: "输入有误，请填写真实的开户行地址"});

$("#youxiaoqi").formValidator({onShow:"请输入有效期（正整数）",onFocus:"有效期为必填项",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"有效期两端不能有空格，请确认"},onError:"有效期不能为空，请填写"})
.regexValidator({regExp:"intege1",dataType:"enum",onError:"有效期格式有误"});

$("#itLianxifangshi").formValidator({onShow:"请输入联系方式",onFocus:"联系方式为必填项",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:true,rightEmpty:true,emptyError:"有效期两端不能有空格，请确认"},onError:"联系方式不能为空,请填写"});

$("#dianhua").formValidator({onShow:"请填写正确的联系号码",onFocus:"请注意您输入的号码格式，例如:010-****或者 132_**",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:true,rightEmpty:true,emptyError:"联系号码不能为空，请输入"},onError:"联系号码不能为空，请输入"})
.regexValidator({regExp:["tel","mobile"],dataType:"enum",onError:"您输入的手机或电话格式有误"});
// .regexValidator({regExp:"tel",dataType:"enum",onError:"号码格式有误"});

$("#gongsimingcheng").formValidator({onShow:"请输入公司名称",onFocus:"公司名称为必填项",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:true,rightEmpty:true,emptyError:"公司名称为必填项，请填写"},onError:"公司名称为必填项，请填写"});

$("#pingtai").formValidator({onShow:"请输入使用平台",onFocus:"使用平台为必填项",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:true,rightEmpty:true,emptyError:"使用平台为必填项，请填写"},onError:"使用平台为必填项，请填写"});


$("#jianli").formValidator({onShow:"请输入个人简历",onFocus:"个人简历为必填项",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:true,rightEmpty:true,emptyError:"个人简历为必填项，请填写"},onError:"个人简历为必填项，请填写"});

$("#diqu").formValidator({onShow:"请选择地点",onFocus:"地点为必选项",onCorrect:"",defaultValue:""})
.inputValidator({min:1,onError: "地点为必选项，请选择"});

$("#xueli").formValidator({onShow:"请选择学历",onFocus:"学历为必选项",onCorrect:"",defaultValue:""})
.inputValidator({min:1,onError: "学历为必选项，请选择"});

$("#sex").formValidator({onShow:"请选择性别",onFocus:"性别为必选项",onCorrect:"",defaultValue:""})
.inputValidator({min:1,onError: "性别为必选项，请选择"});

$("#hezuofenlei").formValidator({onShow:"请选择投资合作类别",onFocus:"类别为必选项",onCorrect:"",defaultValue:""})
.inputValidator({min:1,onError: "类别为必选项，请选择"});

$("#nianling").formValidator({onShow:"请输入年龄",onFocus:"请输入年龄（正整数）",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"年龄数字两端不能有空格，请确认"},onError:"年龄为必填项，请填写"})
.regexValidator({regExp:"intege1",dataType:"enum",onError:"年龄必须是正整数，请确认"});

$("#num").formValidator({onShow:"请填写金额",onFocus:"金额为必填项",onCorrect:""})
.inputValidator({min:100,type:"value",onError: "金额不低于100元整"});

$("#zhifupwd").formValidator({onShow:"请填写支付密码",onCorrect:""})
.inputValidator({min:6,onError: "支付密码不少于6个字符"});

$("#xiangmukuan").formValidator({onShow:"",onFocus:"<font color=red>*</font> 计划项目款从注入的项目资金中分配，如项目资金不足请<a href='/my/user'>追加</a>",onCorrect:""})
.inputValidator({min:50, type:"value",onError:"计划金额不低于50元整"}) 
.regexValidator({regExp:"intege1",dataType:"enum",onError:"价格格式不正确"});

$('#lichengbei').formValidator({onShow:"请填写验收标准",onFocus:"请填写验收标准",onCorrect:""})
.inputValidator({min:1,empty:{leftEmpty:true,rightEmpty:true,emptyError:"验收标准为必填项，请填写"},onError:"验收标准为必填项，请填写"});

$('#xiangmuyusuan').formValidator({onShow:"建议预算控制在500~10000元，小项目更易成功",onFocus:"建议预算控制在500~10000元，小项目更易成功",onCorrect:""})
.inputValidator({min:1,onError: "项目预算为必选项，请选择"});

$('#realname').formValidator({onFocus:"姓名请控制在4－10个字符",onCorrect:""})
.inputValidator({min:4,onError: "您输入的姓名格式有误,请重新输入"});

$('#idcard').formValidator({onFocus:"请填写身份证号码",onCorrect:""})
.functionValidator({fun:isCardID,onError:"身份证号码有误，请重新输入"});

$('#zhifubaoid').formValidator({onFocus:"请填写支付宝账号",onCorrect:""})
.inputValidator({empty:false,min:1,onError: "您输入的支付宝账号有误,请重新输入"});

$('#bankid').formValidator({onShow:"",onFocus:"请填写银行账号",onCorrect:""})
.functionValidator({fun:creditCard,onError:"银行账号有误，请重新输入"});

$('#zhifubaoshiming').formValidator({empty:true,onFocus:"请填写支付宝账号或不填"})
.inputValidator({empty:true,min:5,onError: "银行账号有误，请重新输入"});

$('#bankshiming').formValidator({empty:true,onFocus:"请填写银行账号（允许空缺）",onCorrect:""})
.functionValidator({fun:creditCard,onError:"银行账号有误，请重新输入"});

$('#shenfenzhengtupian').formValidator({onFocus:"请上传身份证图片",onCorrect:""})
.inputValidator({min:1,onError: "请上传身份证图片"});

$('#youjidizhi').formValidator({onFocus:"请输入邮寄地址",onCorrect:""})
.inputValidator({min:1,onError: "请输入邮寄地址"});

$('#youbian').formValidator({onFocus:"请输入邮编",onCorrect:""})
.inputValidator({min:6,onError: "邮编有误，请核查"})
.regexValidator({regExp:"zipcode",dataType:"enum",onError:"邮编有误，请核查"});


$('#shouxinren').formValidator({onFocus:"请输入收信人",onCorrect:""})
.inputValidator({min:1,onError: "请输入收信人"});


$("#province").formValidator({onShow:"请选择所在地",onFocus:"所在地为必选项",onCorrect:"",defaultValue:""})
.inputValidator({min:1,onError: "所在地为必选项，请选择"});


if ($("#qixian").length > 0) {
    $("#qixian").datepicker( $.datepicker.regional[ "zh" ] );
    var minDate = $( "#qixian" ).datepicker( "option", "minDate" );
    $("#qixian").datepicker( "option", "minDate", new Date() );
}
if ($("#newqixian").length > 0) {
    $("#newqixian").datepicker( $.datepicker.regional[ "zh" ] );
    var minDate = $( "#newqixian" ).datepicker( "option", "minDate" );
    $("#newqixian").datepicker( "option", "minDate", new Date() );
}

if ($("#modqixian").length > 0) {
    $("#modqixian").datepicker( $.datepicker.regional[ "zh" ] );
    var minDate = $( "#modqixian" ).datepicker( "option", "minDate" );
    $("#modqixian").datepicker( "option", "minDate", new Date() );
}
 
/** ******confirm********* */
    $(".overlay").css({"height" : $(document).height()});
    // 链接弹跳提示框
    $('.confirm').click(function() {
        $(this).attr("disabled",true);
        var action = $(this).attr('act');
        var msg = $(this).attr('msg');
        var title = $(this).attr('title');
        var gotoact = $(this).attr('gotoaction');
        var gotoaction = gotoact;
        var postform = $(this).attr('postform');

        if (typeof(gotoact)=='undefined' || gotoact == '') {
            gotoaction = 0;
        }

        if (typeof(postform)=='undefined' || postform == '') {
            postform = 0;
        }
        var data = {"flag":gotoaction, "winId":"confirm-Window", "act":action, 'msg':msg,'title':title, 'postform':postform};
        var ConfirmWindow = CreateConfirmWindow(data, '');    /**
																 * 创建Conform
																 * Window*
																 */
        InitConfirmWindow(ConfirmWindow, false);              /**
																 * 初始化Conform
																 * Window*
																 */
        ConfirmWindow.dialog('open');  // 打开第一次提示框
        var txt_h = $("#confirm_msg").outerHeight();
        var icon_h = $('#d_icon').outerHeight();
        var m_h = (txt_h - icon_h)/2;
        if (m_h > 5 ) {
            m_h = m_h - 5;
        }
        $('#d_icon').css('margin-top', m_h);
    });
    // 弹出表单框
    $(".formConfirm").click(function() {
        var act = $(this).attr('act');
        var title = $(this).attr('title');
        getFormStr(act, title);
    });

});
(function( $, undefined ) {
        /** *****2014/03/25 jm 输入表单提示初始化************ */
        var onShowHtml = "";
        var onFocusHtml = "<span><span class='$class$_top'>$data$</span><span class='$class$_bot'></span></span>";
        var onErrorHtml = "<span><span class='$class$_top'>$data$</span><span class='$class$_bot'></span></span>";
        var onCorrectHtml = "<span class='$class$'></span>";
        var onShowClass = "input_public";
        var onFocusClass = "input_public input_focus";
        var onErrorClass = "input_public input_error";
        var onShowClass = "form-control input_public";
        var onFocusClass = "form-control input_public input_focus";
        var onErrorClass = "form-control input_public input_error";
        var onCorrectClass = "form-control input_public input_correct";
        /** ***************** */
$.formValidator = 
{
    // 全局配置
    initConfig : function(controlOptions)
    {
        var settings = {};
        $.extend(true, settings, initConfig_setting, controlOptions || {});
        // 如果是精简模式，发生错误的时候，第一个错误的控件就不获得焦点
        if(settings.mode == "SingleTip"){settings.errorFocus=false};
        // 如果填写了表单和按钮，就注册验证事件
        if(settings.formID!=""){
            $("#"+settings.formID).submit(function(){
                if(settings.ajaxForm!=null){
                    $.formValidator.ajaxForm(settings.validatorGroup,settings.ajaxForm);
                    return false;
                }
                else
                {
                    if (settings.ajaxCountValid > 0) {
                    // settings.onAlert(settings.ajaxPrompt);
                        return false;
                    }
                    return $.formValidator.pageIsValid(settings.validatorGroup);
                }
            });
        }
        else if(settings.submitButtonID!="")
        {
            $("#"+settings.submitButtonID).click(function(){
                if(settings.ajaxForm!=null){
                    $.formValidator.ajaxForm(settings.validatorGroup,settings.ajaxForm);
                    return false;
                }
                else
                {
                    if (settings.ajaxCountValid > 0) {
                    // settings.onAlert(settings.ajaxPrompt);
                        return false;
                    }
                    return $.formValidator.pageIsValid(settings.validatorGroup);
                }
            });
        }

        $("body").data(settings.validatorGroup, settings);
        if(settings.theme==""){return}
        // 读取主题对应的脚本
        var scriptSrcArray = fv_scriptSrc.split('/');
        var jsName = scriptSrcArray[scriptSrcArray.length-1];
        var themedir = fv_scriptSrc.replace(jsName,'');

 /** ******* 2014/03/25 jm removed ***************** */
// $.ajax({async:false,type: "GET",url: themedir +
// "themes/"+settings.theme+"/js/theme.js",dataType: "script",
// error :function(){/*alert('当前皮肤加载出错，请确认皮肤【'+settings.theme+'】是否存在')*/}
// });
        // 读取主题对应的样式 //2014/03/25 jm removed
// if($.support)
// {
// var css=document.createElement("link");
// css.rel="stylesheet";
// css.type="text/css";
// css.href=themedir+"themes/"+settings.theme+"/style/style.css";
// document.getElementsByTagName("head")[0].appendChild(css);
// }else{
// var style=document.createElement('style');
// style.setAttribute("type", "text/css");
// var styCss = "@import
// url('"+themedir+"themes/"+settings.theme+"/style/style.css');";
// if (style.styleSheet) {style.styleSheet.cssText=styCss} else
// {style.appendChild(document.createTextNode(styCss))}
// document.getElementsByTagName("head")[0].appendChild(style);
// }
/** *****************remove end****************************** */
    },

    // 各种校验方式支持的控件类型
    sustainType : function(elem,validateType)
    {
        var srcTag = elem.tagName;
        var stype = elem.type;
        switch(validateType)
        {
            case "formValidator":
                return true;
            case "inputValidator":
                return (srcTag == "INPUT" || srcTag == "TEXTAREA" || srcTag == "SELECT");
            case "compareValidator":
                return ((srcTag == "INPUT" || srcTag == "TEXTAREA") ? (stype != "checkbox" && stype != "radio") : false);
            case "ajaxValidator":
                return (stype == "text" || stype == "textarea" || stype == "file" || stype == "password" || stype == "select-one");
            case "regexValidator":
                return ((srcTag == "INPUT" || srcTag == "TEXTAREA") ? (stype != "checkbox" && stype != "radio") : false);
            case "functionValidator":
                return true;
            case "passwordValidator":
                return stype == "password";
        }
    },
    
    // 如果validator对象对应的element对象的validator属性追加要进行的校验。
    appendValid : function(id, setting) {
        // 如果是各种校验不支持的类型，就不追加到。返回-1表示没有追加成功
        var elem = $("#"+id).get(0);
        var validateType = setting.validateType;
        if(!$.formValidator.sustainType(elem,validateType)){return -1}
        // 重新初始化
        if (validateType=="formValidator" || elem.settings == undefined ){elem.settings = new Array()}
        // 如果第一个不是formValidator就默认初始化一次。
        if(elem.settings.length==0 && validateType!="formValidator"){$(elem).formValidator()};
        var len = elem.settings.push( setting );
        elem.settings[len - 1].index = len - 1;
        return len - 1;
    },

    // 设置显示信息
    setTipState : function(elem,showclass,showmsg)
    {
        var tip = $("#"+elem.settings[0].tipID);
        if(showmsg==null || showmsg=="")
        {
            tip.hide();
        }
        else
        {
        var initConfig = $("body").data(elem.validatorGroup);

        if(initConfig.mode == "SingleTip")
        {
            // 显示和保存提示信息
            $("#fv_content").html(showmsg);
            elem.Tooltip = showmsg;
            if(showclass!="onError"){tip.hide()}
        }
        else
        {
            var html = showclass == "onShow" ? onShowHtml : (showclass == "onFocus" ? onFocusHtml : (showclass == "onCorrect" ? onCorrectHtml : onErrorHtml));
            if(html.length = 0)
            {
                tip.hide()
            }
            else
            {
                if(elem.validatorPasswordIndex > 0 && showclass =="onCorrect"){
                    var setting = elem.settings[elem.validatorPasswordIndex];
                    var level = $.formValidator.passwordValid(elem);
                    showmsg = "";
                    if(level==-1 && setting.onErrorContinueChar!=""){
                        showmsg=setting.onErrorContinueChar
                    }else if(level==-2 && setting.onErrorSameChar!=""){
                        showmsg=setting.onErrorSameChar
                    }else if(level==-3 && setting.onErrorCompareSame!=""){
                        showmsg=setting.onErrorCompareSame
                    }
                    if(showmsg!="")
                    {
                        $.formValidator.setTipState(elem,'onError',showmsg);
                        return
                    }
                    showmsg = passwordStrengthText[level<=0?0:level - 1];
                }
                html = html.replace(/\$class\$/g, showclass).replace(/\$data\$/g, showmsg);
                if(showclass!=""){
                    tip.html(html).removeClass().addClass(showclass).show();
                }else{
                    tip.html(html).show();
                }
            }
            var stype = elem.type;
            if(stype == "password" || stype == "text" || stype == "file")
            {
                jqobj = $(elem);
                if(onShowClass!="" && showclass == "onShow"){jqobj.removeClass().addClass(onShowClass)};
                if(onFocusClass!="" && showclass == "onFocus"){jqobj.removeClass().addClass(onFocusClass)};
                if(onCorrectClass!="" && showclass == "onCorrect"){jqobj.removeClass().addClass(onCorrectClass)};
                if(onErrorClass!="" && showclass == "onError"){jqobj.removeClass().addClass(onErrorClass)};
            }
        }
    }
    },

    // 把提示层重置成原始提示(如果有defaultPassed,应该设置为onCorrect)
    resetTipState : function(validatorGroup)
    {
        if(validatorGroup == undefined){validatorGroup = "1"};
        var initConfig = $("body").data(validatorGroup);
        $.each(initConfig.validObjects,function(){
            var setting = this.settings[0];
            if(!setting.bind){return}
            var passed = setting.defaultPassed;
            $.formValidator.setTipState(this, passed ? "onCorrect" : "onShow", passed ? $.formValidator.getStatusText(this,setting.onCorrect) : setting.onShow );
        });
    },

    // 设置错误的显示信息
    setFailState : function(tipID,showmsg)
    {
        $.formValidator.setTipState($("#"+tipID).get(0), "onError", showmsg);
    },

    // 根据单个对象,正确:正确提示,错误:错误提示
    showMessage : function(returnObj)
    {
        var id = returnObj.id;
        var elem = $("#"+id).get(0);
        var isValid = returnObj.isValid;
        var setting = returnObj.setting;// 正确:setting[0],错误:对应的setting[i]
        var showmsg = "",showclass = "";
        var intiConfig = $("body").data(elem.validatorGroup);
        if (!isValid)
        {
            showclass = "onError";
            if(setting.validateType=="ajaxValidator")
            {
                if(setting.lastValid=="")
                {
                    showclass = "onLoad";
                    showmsg = setting.onWait;
                }
                else
                {
                    showmsg = $.formValidator.getStatusText(elem,setting.onError);
                }
            }
            else
            {
                showmsg = (returnObj.errormsg==""? $.formValidator.getStatusText(elem,setting.onError) : returnObj.errormsg);

            }
            if(intiConfig.mode == "AlertTip")
            {
                if(elem.validValueOld!=$(elem).val()){intiConfig.onAlert(showmsg);}
            }
            else
            {
                $.formValidator.setTipState(elem,showclass,showmsg);
            }
        }
        else
        {
            // 验证成功后,如果没有设置成功提示信息,则给出默认提示,否则给出自定义提示;允许为空,值为空的提示
            showmsg = $.formValidator.isEmpty(id) ? setting.onEmpty : $.formValidator.getStatusText(elem,setting.onCorrect);
            $.formValidator.setTipState(elem,"onCorrect",showmsg);
        }
        return showmsg;
    },

    showAjaxMessage : function(e)
    {
        var elem = $("#"+e.id).get(0);
        var setting = elem.settings[e.ajax];
        var validValueOld = elem.validValueOld;
        var validvalue = $(elem).val();
        e.setting = setting;
        // defaultPassed还未处理
        if(validValueOld!= validvalue || validValueOld == validvalue && elem.onceValided == undefined)
        {
            $.formValidator.ajaxValid(e);
        }
        else
        {
            if(setting.isValid!=undefined && !setting.isValid){
                elem.lastshowclass = "onError";
                elem.lastshowmsg = $.formValidator.getStatusText(elem,setting.onError);
            }
            $.formValidator.setTipState(elem,elem.lastshowclass,elem.lastshowmsg);
            if(setting.lastValid == -1) {
                $('.onLoad').hide();
            }
        }
    },

    // 获取指定字符串的长度
    getLength : function(id)
    {
        var srcjo = $("#"+id);
        var elem = srcjo.get(0);
        var sType = elem.type;
        var len = 0;
        switch(sType)
        {
            case "text":
            case "hidden":
            case "password":
            case "textarea":
            case "file":
                var val = trim(srcjo.val());
                var setting = elem.settings[0];
                // 如果有显示提示内容的，要忽略掉
                if(elem.isInputControl && elem.value == setting.onShowText){val=""}
                var initConfig = $("body").data(elem.validatorGroup);
                if (initConfig.wideWord)
                {
                    for (var i = 0; i < val.length; i++)
                    {
                        len = len + ((val.charCodeAt(i) >= 0x4e00 && val.charCodeAt(i) <= 0x9fa5) ? 2 : 1);
                    }
                }
                else{
                    len = val.length;
                }
                break;
            case "checkbox":
            case "radio":
                len = $("input[type='"+sType+"'][name='"+srcjo.attr("name")+"']:checked").length;
                break;
            case "select-one":
                len = elem.options ? elem.options.selectedIndex : -1;
                break;
            case "select-multiple":
                len = $("select[name="+elem.name+"] option:selected").length;
                break;
        }
        return len;
    },
    
    // 结合empty这个属性，判断仅仅是否为空的校验情况。
    isEmpty : function(id)
    {
        return ($("#"+id).get(0).settings[0].empty && $.formValidator.getLength(id)==0);
    },
    
    // 对外调用：判断单个表单元素是否验证通过，不带回调函数
    isOneValid : function(id)
    {
        return $.formValidator.oneIsValid(id).isValid;
    },
    
    // 验证单个是否验证通过,正确返回settings[0],错误返回对应的settings[i]
    oneIsValid : function (id)
    {
        var e = {};
        e.id = id;
        e.dom = $("#"+id).get(0);
        e.initConfig = $("body").data(e.dom.validatorGroup);
        e.ajax = -1;
        e.errormsg = "";       // 自定义错误信息
        e.settings = e.dom.settings;
        var settingslen = e.settings.length;
        var validateType;
        // 只有一个formValidator的时候不检验
        if (settingslen==1){e.settings[0].bind=false;}
        if(!e.settings[0].bind){return null;}
        $.formValidator.resetInputValue(true,e.initConfig,id);
        for ( var i = 0 ; i < settingslen ; i ++ )
        {
            if(i==0){
                // 如果为空，直接返回正确
                if($.formValidator.isEmpty(id)){
                    e.isValid = true;
                    e.setting = e.settings[0];
                    break;
                }
                continue;
            }
            e.setting = e.settings[i];
            validateType = e.settings[i].validateType;
            // 根据类型触发校验
            switch(validateType)
            {
                case "inputValidator":
                    $.formValidator.inputValid(e);
                    break;
                case "compareValidator":
                    $.formValidator.compareValid(e);
                    break;
                case "regexValidator":
                    $.formValidator.regexValid(e);
                    break;
                case "functionValidator":
                    $.formValidator.functionValid(e);
                    break;
                case "ajaxValidator":
                    // 如果是ajax校验，这里直接取上次的结果值
                    e.ajax = i;
                    break;
                case "passwordValidator":
                    break;
            }
            if(!e.settings[i].isValid) {
                e.isValid = false;
                e.setting = e.settings[i];
                break;
            }else{
                e.isValid = true;
                e.setting = e.settings[0];
                if (e.settings[i].validateType == "ajaxValidator"){break;};
            }
        }
        $.formValidator.resetInputValue(false,e.initConfig,id);
        return e;
    },

    // 验证所有需要验证的对象，并返回是否验证成功（如果曾经触发过ajaxValidator，提交的时候就不触发校验，直接读取结果）
    pageIsValid : function (validatorGroup)
    {
        if(validatorGroup == undefined){validatorGroup = "1"};
        var isValid = true,returnObj,firstErrorMessage="",errorMessage;
        var error_tip = "^",thefirstid,name,name_list="^";
        var errorlist = new Array();
        // 设置提交状态、ajax是否出错、错误列表
        var initConfig = $("body").data(validatorGroup);
        initConfig.status = "sumbiting";
        initConfig.ajaxCountSubmit = 0;
        // 遍历所有要校验的控件,如果存在ajaxValidator就先直接触发
        $.each(initConfig.validObjects,function()
        {
            if($(this).length==0){return true}
            if (!this.settings[0].bind){return true}
            if (this.validatorAjaxIndex!=undefined && this.onceValided == undefined) {
                returnObj = $.formValidator.oneIsValid(this.id);
                if (returnObj.ajax == this.validatorAjaxIndex) {
                    initConfig.status = "sumbitingWithAjax";
                    $.formValidator.ajaxValid(returnObj);
                }
            }
        });
        // 如果有提交的时候有触发ajaxValidator，所有的处理都放在ajax里处理
        if(initConfig.ajaxCountSubmit > 0){return false}
        // 遍历所有要校验的控件
        $.each(initConfig.validObjects,function()
        {
            // 只校验绑定的控件
            if($(this).length==0){return true};
            if(this.settings[0].bind){
                name = this.name;
                // 相同name只校验一次
                if (name_list.indexOf("^"+name+"^") == -1) {
                    onceValided = this.onceValided == undefined ? false : this.onceValided;
                    if(name){name_list = name_list + name + "^"};
                    returnObj = $.formValidator.oneIsValid(this.id);
                    if (returnObj) {
                        // 校验失败,获取第一个发生错误的信息和ID
                        if (!returnObj.isValid) {
                            // 记录不含ajaxValidator校验函数的校验结果
                            isValid = false;
                            errorMessage = returnObj.errormsg == "" ? returnObj.setting.onError : returnObj.errormsg;
                            errorlist[errorlist.length] = errorMessage;
                            if (thefirstid == null) {thefirstid = returnObj.id};
                            if(firstErrorMessage==""){firstErrorMessage=errorMessage};
                        }
                        // 为了解决使用同个TIP提示问题:后面的成功或失败都不覆盖前面的失败
                        if (initConfig.mode != "AlertTip") {
                            var tipID = this.settings[0].tipID;
                            if (error_tip.indexOf("^" + tipID + "^") == -1) {
                                if (!returnObj.isValid) {error_tip = error_tip + tipID + "^"};
                                $.formValidator.showMessage(returnObj);
                            }
                        }
                        // 如果是逐个校验的，且当前校验失败，就直接返回
                        if(initConfig.oneByOneVerify && !returnObj.isValid){return false}
                    }
                }
            }
        });

        // 成功或失败进行回调函数的处理，以及成功后的灰掉提交按钮的功能
        if(isValid)
        {
            if(!initConfig.onSuccess()){return false};
            if(initConfig.submitOnce){$(":submit,:button,:reset").attr("disabled",true);}
        }
        else
        {
            initConfig.onError(firstErrorMessage, $("#" + thefirstid).get(0), errorlist);
            if (thefirstid && initConfig.errorFocus) {$("#" + thefirstid).focus()};
        }
        initConfig.status="init";
        if(isValid && initConfig.debug){alert("现在正处于调试模式(debug:true)，不能提交");}
        return !initConfig.debug && isValid;
    },

    // 整个表单
    ajaxForm : function(validatorGroup,option,formid)
    {
        if(validatorGroup == undefined){validatorGroup = "1"};
        var setting = {};
        $.extend(true, setting, ajaxForm_setting, option || {});
        var initConfig = $("body").data(validatorGroup);
        if(formid==undefined){
            formid = initConfig.formID;
            if(formid==""){alert('表单ID未传入');return false;};
        };
        if(!$.formValidator.pageIsValid(validatorGroup)){return false};
        var ls_url = setting.url;
        var ls_data = setting.data;
        var parm = $.formValidator.serialize('#'+formid);
        if(setting.type=="POST"){
            ls_data = ls_data + (ls_data != "" ? ("&" + parm) : parm)
        }else{
            ls_url = ls_url + (ls_url.indexOf("?") > -1 ? ("&" + parm) : ("?" + parm))
        }
        $.ajax(
        {
            type : setting.type,
            url : ls_url,
            cache : setting.cache,
            data : ls_data,
            async : setting.async,
            timeout : setting.timeout,
            dataType : setting.dataType,
            beforeSend : function(jqXHR, configs){// 再服务器没有返回数据之前，先回调提交按钮
                if(setting.buttons && setting.buttons.length > 0){setting.buttons.attr({"disabled":true})};
                return setting.beforeSend(jqXHR, configs);
            },
            success : function(data, textStatus, jqXHR){setting.success(data, textStatus, jqXHR);},
            complete : function(jqXHR, textStatus){
                if(setting.buttons && setting.buttons.length > 0){setting.buttons.attr({"disabled":false})};
                setting.complete(jqXHR, textStatus);
            },
            error : function(jqXHR, textStatus, errorThrown){setting.error(jqXHR, textStatus, errorThrown);}
        });
    },

    // 把编码decodeURIComponent反转之后，再escape
    serialize : function(objs,initConfig)
    {
        if(initConfig!=undefined){$.formValidator.resetInputValue(true,initConfig)};
        var parmString = $(objs).serialize();
        if(initConfig!=undefined){$.formValidator.resetInputValue(false,initConfig)};
        var parmArray = parmString.split("&");
        var parmStringNew="";
        $.each(parmArray,function(index,data){
            var li_pos = data.indexOf("=");
            if(li_pos >0){
                var name = data.substring(0,li_pos);
                var value = escape(decodeURIComponent(data.substr(li_pos+1)));
                var parm = name+"="+value;
                parmStringNew = parmStringNew=="" ? parm : parmStringNew + '&' + parm;
            }
        });
        return parmStringNew;
    },

    // ajax校验
    ajaxValid : function(e)
    {
        var id = e.id;
        var srcjo = $("#"+id);
        var elem = srcjo.get(0);
        var initConfig = e.initConfig;
        var settings = elem.settings;
        var setting = settings[e.ajax];
        var ls_url = setting.url;
        var ls_data = setting.data;
        // 获取要传递的参数
        var validatorGroup = elem.validatorGroup;
        var initConfig = $("body").data(validatorGroup);
        var parm = $.formValidator.serialize(initConfig.ajaxObjects);
        // 添加触发的控件名、随机数、传递的参数
        parm = "clientid=" + id + "&" +(setting.randNumberName ? setting.randNumberName+"="+((new Date().getTime())+Math.round(Math.random() * 10000)) : "") + (parm.length > 0 ? "&" + parm : "");
        if(setting.type=="POST"){
            ls_data = ls_data + (ls_data != "" ? ("&" + parm) : parm)
        }else{
            ls_url = ls_url + (ls_url.indexOf("?") > -1 ? ("&" + parm) : ("?" + parm))
        }
        // 发送ajax请求
        $.ajax(
        {
            type : setting.type,
            url : ls_url,
            cache : setting.cache,
            data : ls_data,
            async : setting.async,
            timeout : setting.timeout,
            dataType : setting.dataType,
            success : function(data, textStatus, jqXHR){
                var lb_ret,ls_status,ls_msg,lb_isValid = false;
                $.formValidator.dealAjaxRequestCount(validatorGroup,-1);
                e.dom.onceValided = true;
                // 根据业务判断设置显示信息
                lb_ret = setting.success(data, textStatus, jqXHR);
                if((typeof lb_ret)=="string")
                {
                    ls_status = "onError";
                    ls_msg = lb_ret;
                }
                else if(lb_ret){
                    lb_isValid = true;
                    ls_status = "onCorrect";
                    ls_msg = settings[0].onCorrect;
                }else{
                    ls_status = "onError";
                    ls_msg = $.formValidator.getStatusText(elem,setting.onError);
                }
                setting.isValid = lb_isValid;
                $.formValidator.setTipState(elem,ls_status,ls_msg);
                // 提交的时候触发了ajax校验，等ajax校验完成，无条件重新校验
                if(e.initConfig.status=="sumbitingWithAjax" && e.initConfig.ajaxCountSubmit == 0)
                {
                    if (initConfig.formID != "") {
                        $('#' + initConfig.formID).trigger('submit');
                    }
                }
            },
            complete : function(jqXHR, textStatus){
                if(setting.buttons && setting.buttons.length > 0){setting.buttons.attr({"disabled":false})};
                setting.complete(jqXHR, textStatus);
            },
            beforeSend : function(jqXHR, configs){
                // 本控件如果正在校验，就中断上次
                if (this.lastXMLHttpRequest) {this.lastXMLHttpRequest.abort()};
                this.lastXMLHttpRequest = jqXHR;
                // 再服务器没有返回数据之前，先回调提交按钮
                if(setting.buttons && setting.buttons.length > 0){setting.buttons.attr({"disabled":true})};
                var lb_ret = setting.beforeSend(jqXHR,configs);
                var isValid = false;
                // 无论是否成功都当做失败处理
                setting.isValid = false;
                if((typeof lb_ret)=="boolean" && lb_ret)
                {
                    isValid = true;
                    $.formValidator.setTipState(elem,"onLoad",settings[e.ajax].onWait);
                }else
                {
                    isValid = false;
                    $.formValidator.setTipState(elem,"onError",lb_ret);
                }
                setting.lastValid = "-1";
                if(isValid){$.formValidator.dealAjaxRequestCount(validatorGroup,1);}
                return isValid;
            },
            error : function(jqXHR, textStatus, errorThrown){
                $.formValidator.dealAjaxRequestCount(validatorGroup,-1);
                $.formValidator.setTipState(elem,"onError",$.formValidator.getStatusText(elem,setting.onError));
                setting.isValid = false;
                e.dom.onceValided = true;
                setting.error(jqXHR, textStatus, errorThrown);
            },
            processData : setting.processData
        });
    },

    // 处理ajax的请求个数
    dealAjaxRequestCount : function(validatorGroup,val)
    {
        var initConfig = $("body").data(validatorGroup);
        initConfig.ajaxCountValid = initConfig.ajaxCountValid + val;
        if (initConfig.status == "sumbitingWithAjax") {
            initConfig.ajaxCountSubmit = initConfig.ajaxCountSubmit + val;
        }
    },

    // 对正则表达式进行校验（目前只针对input和textarea）
    regexValid : function(returnObj)
    {
        var id = returnObj.id;
        var setting = returnObj.setting;
        var srcTag = $("#"+id).get(0).tagName;
        var elem = $("#"+id).get(0);
        var isValid;
        // 如果有输入正则表达式，就进行表达式校验
        if(elem.settings[0].empty && elem.value==""){
            setting.isValid = true;
        }
        else
        {
            var regexArray = setting.regExp;
            setting.isValid = false;
            if((typeof regexArray)=="string") regexArray = [regexArray];
            $.each(regexArray, function() {
                var r = this;
                if(setting.dataType=="enum"){r = eval("regexEnum."+r);}
                if(r==undefined || r=="")
                {
                    return false;
                }
                isValid = (new RegExp(r, setting.param)).test($(elem).val());

                if(setting.compareType=="||" && isValid)
                {
                    setting.isValid = true;
                    return false;
                }
                if(setting.compareType=="&&" && !isValid)
                {
                    return false
                }
            });
            if(!setting.isValid) setting.isValid = isValid;
        }
    },

    // 函数校验。返回true/false表示校验是否成功;返回字符串表示错误信息，校验失败;如果没有返回值表示处理函数，校验成功
    functionValid : function(returnObj)
    {
        var id = returnObj.id;
        var setting = returnObj.setting;
        var srcjo = $("#"+id);
    // var lb_ret = setting.fun(srcjo.val(),srcjo.get(0));
    var lb_ret = setting.fun(trim(srcjo.val()),srcjo.get(0));
        if(lb_ret != undefined)
        {
            if((typeof lb_ret) === "string"){
                setting.isValid = false;
                returnObj.errormsg = lb_ret;
            }else{
                setting.isValid = lb_ret;
            }
        }else{
            setting.isValid = true;
        }
    },

    // 对input和select类型控件进行校验
    inputValid : function(returnObj)
    {
        var id = returnObj.id;
        var setting = returnObj.setting;
        var srcjo = $("#"+id);
        var elem = srcjo.get(0);
// var val = srcjo.val();
        var val =trim(srcjo.val())      // jm added trim
        var sType = elem.type;
        var len = $.formValidator.getLength(id);
        var empty = setting.empty,emptyError = false;
        switch(sType)
        {
            case "text":
            case "hidden":
            case "password":
            case "textarea":
            case "file":
                if (setting.type == "size") {
                    empty = setting.empty;
                    if(!empty.leftEmpty){
                        emptyError = (val.replace(/^[ \s]+/, '').length != val.length);
                    }
                    if(!emptyError && !empty.rightEmpty){
                        emptyError = (val.replace(/[ \s]+$/, '').length != val.length);
                    }
                    if(emptyError && empty.emptyError){returnObj.errormsg= empty.emptyError}
                }
            case "checkbox":
            case "select-one":
            case "select-multiple":
            case "radio":
                var lb_go_on = false;
                if(sType=="select-one" || sType=="select-multiple"){setting.type = "size";}
                var type = setting.type;
                if (type == "size") {		// 获得输入的字符长度，并进行校验
                    if(!emptyError){lb_go_on = true}
                    if(lb_go_on){val = len}
                }
                else if (type =="date" || type =="datetime")
                {
                    var isok = false;
                    if(type=="date"){lb_go_on = isDate(val)};
                    if(type=="datetime"){lb_go_on = isDate(val)};
                    if(lb_go_on){val = new Date(val);setting.min=new Date(setting.min);setting.max=new Date(setting.max);};
                }else{
                    stype = (typeof setting.min);
                    if(stype =="number")
                    {
                        val = (new Number(val)).valueOf();
                        if(!isNaN(val)){lb_go_on = true;}
                    }
                    if(stype =="string"){lb_go_on = true;}
                }
                setting.isValid = false;
                if(lb_go_on)
                {
                    if(val < setting.min || val > setting.max){
                        if(val < setting.min && setting.onErrorMin){
                            returnObj.errormsg= setting.onErrorMin;
                        }
                        if(val > setting.min && setting.onErrorMax){
                            returnObj.errormsg= setting.onErrorMax;
                        }
                    }
                    else{
                        setting.isValid = true;
                    }
                }
                break;
        }
    },

    // 对两个控件进行比较校验
    compareValid : function(returnObj)
    {
        var id = returnObj.id;
        var setting = returnObj.setting;
        var srcjo = $("#"+id);
        var desjo = $("#"+setting.desID );
        var ls_dataType = setting.dataType;

// curvalue = srcjo.val();
        curvalue = trim(srcjo.val());
        ls_data = desjo.val();
        if(ls_dataType=="number")
        {
            if(!isNaN(curvalue) && !isNaN(ls_data)){
                curvalue = parseFloat(curvalue);
                ls_data = parseFloat(ls_data);
            }
            else{
                return;
            }
        }
        if(ls_dataType=="date" || ls_dataType=="datetime")
        {
            var isok = false;
            if(ls_dataType=="date"){isok = (isDate(curvalue) && isDate(ls_data))};
            if(ls_dataType=="datetime"){isok = (isDateTime(curvalue) && isDateTime(ls_data))};
            if(isok){
                curvalue = new Date(curvalue);
                ls_data = new Date(ls_data)
            }
            else{
                return;
            }
        }

        switch(setting.operateor)
        {
            case "=":
                setting.isValid = (curvalue == ls_data);
                break;
            case "!=":
                setting.isValid = (curvalue != ls_data);
                break;
            case ">":
                setting.isValid = (curvalue > ls_data);
                break;
            case ">=":
                setting.isValid = (curvalue >= ls_data);
                break;
            case "<":
                setting.isValid = (curvalue < ls_data);
                break;
            case "<=":
                setting.isValid = (curvalue <= ls_data);
                break;
            default :
                setting.isValid = false;
                break;
        }
    },

    // 获取密码校验等级
    passwordValid : function(elem)
    {
        var setting = elem.settings[elem.validatorPasswordIndex];
        var pwd = elem.value;
        // 是否为连续字符
        function isContinuousChar(str){
            var str = str.toLowerCase();
            var flag = 0;
            for(var i=0;i<str.length;i++){
                if(str.charCodeAt(i) != flag+1 && flag!=0)
                    return false;
                else
                    flag = str.charCodeAt(i);
            }
            return true;
        }
        // 是否字符都相同
        function isSameChar(str){
            var str = str.toLowerCase();
            var flag = 0;
            for(var i=0;i<str.length;i++){
                if(str.charCodeAt(i) != flag && flag!=0)
                    return false;
                else
                    flag = str.charCodeAt(i);
            }
            return true;
        }
        // 获取标记所在的位置，用1表示
        function getFlag(val,sum,index)
        {
            if(sum==undefined){sum=[0,0,0,0]}
            if(index==undefined){index=-1};
            index ++;
            sum[index] = val % 2;
            val = Math.floor(val / 2);
            if(val==1 || val==0){sum[index+1] = val;return sum}
            sum = getFlag(val,sum,index);
            return sum;
        }

        // 判断密码各个位置的组成情况
        if(pwd==""){return 0};
        if(setting.onErrorContinueChar!="" && isContinuousChar(pwd)){return -1};
        if(setting.onErrorSameChar!="" && isSameChar(pwd)){return -2};
        if(setting.compareID!="" && $("#"+setting.compareID).val()==pwd){return -3};
        var sum1 = [0, 0, 0, 0];
        var specicalChars = "!,@,#,$,%,\^,&,*,?,_,~";
        var len = pwd.length;
        for (var i=0; i< len; i++) {
            var c = pwd.charCodeAt(i);
            if (c >=48 && c <=57){  // 数字
                sum1[0] += 1;
            }else if (c >=97 && c <=122){ // 小写字母
                sum1[1] += 1;
            }else if (c >=65 && c <=90){ // 大写字母
                sum1[2] += 1;
            }else if(specicalChars.indexOf(pwd.substr(i,1))>=0){ // 特殊字符
                sum1[3] += 1;
            }
        }

        // 遍历json变量获取字符串
        var returnLevel = 0;
        var hasFind = true;
        $.each(passwordStrengthRule,function(j,n){
            var level = n.level;
            var rules = n.rule;
            $.each(rules,function(i,rule){
                var index = 0;
                // 依次编译所有的、有配置(该位置==1)的节点
                hasFind = true;
                $.each(getFlag(rule.flag),function(k,value){
                    if(value==1){
                        val = rule.value[index++];
                        var val = val == 0 ? len : (val > len ? len : val);
                        if(sum1[k] < val){hasFind = false;return false;}
                    }
                });
                if(hasFind){returnLevel = level;return false;}
            });
            if(hasFind){returnLevel = level;}
        });
        return returnLevel;
    },

    // 定位漂浮层
    localTooltip : function(e)
    {
        e = e || window.event;
        var mouseX = e.pageX || (e.clientX ? e.clientX + document.body.scrollLeft : 0);
        var mouseY = e.pageY || (e.clientY ? e.clientY + document.body.scrollTop : 0);
        $("#fvtt").css({"top":(mouseY+2)+"px","left":(mouseX-40)+"px"});
    },

    reloadAutoTip : function(validatorGroup)
    {
        if(validatorGroup == undefined) validatorGroup = "1";
        var initConfig = $("body").data(validatorGroup);
        $.each(initConfig.validObjects,function()
        {
            var setting = this.settings[0];
            if(initConfig.mode == "AutoTip" && setting.bind== true)
            {
                // 获取层的ID、相对定位控件的ID和坐标
                var relativeID = "#"+setting.relativeID;
                var offset = $(relativeID ).offset();
                var y = offset.top;
                var x = $(relativeID ).width() + offset.left;
                $("#"+setting.tipID).parent().show().css({left: x+"px", top: y+"px"});
            }
        });
    },

    getStatusText : function(elem,obj)
    {
        return ($.isFunction(obj) ? obj($(elem).val()) : obj);
    },

    resetInputValue : function(real,initConfig,id)
    {
        var showTextObjects;
        if(id){
            showTextObjects = $("#"+id);
        }else{
            showTextObjects = $(initConfig.showTextObjects);
        }
        showTextObjects.each(function(index,elem){
            if(elem.isInputControl){
                var showText = elem.settings[0].onShowText;
                if(real && showText==elem.value){elem.value = ""};
                if(!real && showText!="" && elem.value == ""){elem.value = showText};
            }
        });
    }
};

// 每个校验控件必须初始化的
$.fn.formValidator = function(cs) 
{
    cs = cs || {};
    var setting = {};

    // 获取该校验组的全局配置信息
    if(cs.validatorGroup == undefined){cs.validatorGroup = "1"};

    // 先合并整个配置(深度拷贝)
    $.extend(true,setting, formValidator_setting);

    var initConfig = $("body").data(cs.validatorGroup);

    // 如果为精简模式，tipCss要重新设置初始值
    if(initConfig.mode == "SingleTip"){setting.tipCss = {left:10,top:1,width:22,height:22,display:"none"}};

    // 弹出消息提示模式，自动修复错误
    if(initConfig.mode == "AlertTip"){setting.autoModify=true};

    // 先合并整个配置(深度拷贝)
    $.extend(true,setting, cs || {});
    return this.each(function(e)
    {
        this.validatorGroup = cs.validatorGroup;
        var jqobj = $(this);
        // 自动形成TIP
        var setting_temp = {};
        $.extend(true,setting_temp, setting);
        // 判断是否有ID
        var id = jqobj.attr('id');
        if(!id)
        {
            id = Math.ceil(Math.random()*50000000);
            jqobj.attr('id', id);
        }
        var tip = setting_temp.tipID ? setting_temp.tipID : id+"Tip";
        
        if(initConfig.mode == "AutoTip" || initConfig.mode == "FixTip")
        {
            var tipDiv = $("#"+tip);
            // 获取层的ID、相对定位控件的ID和坐标
            if(initConfig.mode == "AutoTip" && tipDiv.length==0)
            {
                var relativeID = setting_temp.relativeID ? setting_temp.relativeID : id;
                var offset = $("#"+relativeID ).offset();
                setting_temp.tipCss.top = offset.top + setting_temp.tipCss.top;
                setting_temp.tipCss.left = $("#"+relativeID ).width() + offset.left + setting_temp.tipCss.left;
                tipDiv = $("<div style='position:absolute;' id='"+tip+"'></div>").appendTo($("body"));
                tipDiv.css(setting_temp.tipCss);
                tipDiv.css("margin","5px 0 0 5px");
                setting.relativeID = relativeID ;
            } else {
                tipDiv.css("margin","-5px 0 0 0");
            }
            tipDiv.css("padding","0px").css("background","transparent").css("display","inline-block").css("vertical-align","middle");

        } else if(initConfig.mode == "SingleTip"){
            jqobj.showTooltips();
        }

        // 每个控件都要保存这个配置信息、为了取数方便，冗余一份控件总体配置到控件上
        setting.tipID = tip;
        setting.pwdTipID = setting_temp.pwdTipID ? setting_temp.pwdTipID : setting.tipID;
        setting.fixTipID = setting_temp.fixTipID ? setting_temp.fixTipID : id+"FixTip";
        $.formValidator.appendValid(id,setting);

        // 保存控件ID
        var validIndex = $.inArray(jqobj,initConfig.validObjects);
        if(validIndex == -1)
        {
            if (setting_temp.ajax) {initConfig.ajaxObjects.push(this)}
            initConfig.validObjects.push(this);
        }else{
            initConfig.validObjects[validIndex] = this;
        }

        // 初始化显示信息
        if(initConfig.mode != "AlertTip"){
            $.formValidator.setTipState(this,"onShow",setting.onShow);
        }

        var srcTag = this.tagName.toLowerCase();
        var stype = this.type;
        var defaultval = setting.defaultValue;
        var isInputControl = stype == "password" || stype == "text" || stype == "textarea";
        this.isInputControl = isInputControl;
        // 处理默认值
        if(defaultval){
            jqobj.val(defaultval);
        }
        // 固定提示内容
        var fixTip = $("#"+setting.fixTipID);
        var showFixText = setting.onShowFixText;
        if(fixTip.length==1 && onMouseOutFixTextHtml!="" && onMouseOnFixTextHtml!="" && showFixText != "")
        {
            jqobj.hover(
                function () {
                    fixTip.html(onMouseOnFixTextHtml.replace(/\$data\$/g, showFixText));
                },
                function () {
                    fixTip.html(onMouseOutFixTextHtml.replace(/\$data\$/g, showFixText));
                }
            );
            fixTip.css("padding","0px 0px 0px 0px").css("margin","0px 0px 0px 0px").html(onMouseOutFixTextHtml.replace(/\$data\$/g, setting.onShowFixText));
        }
        // 获取输入框内的提示内容
        var showText = setting.onShowText;
        if(srcTag == "input" || srcTag=="textarea")
        {
            if (isInputControl) {
                if(showText !="" && jqobj.val() == ""){
                    showObjs = initConfig.showTextObjects;
                    initConfig.showTextObjects = showObjs + (showObjs != "" ? ",#" : "#") + id;
                    jqobj.val(showText);
                    jqobj.css("color",setting.onShowTextColor.mouseOutColor);
                }
            }
            // 注册获得焦点的事件。改变提示对象的文字和样式，保存原值
            jqobj.focus(function()
            {
                if(!setting.bind){return}
                if (isInputControl) {
                    var val = jqobj.val();
                    this.validValueOld = val;
                    if(showText==val){
                        this.value = "";
                        jqobj.css("color",setting.onShowTextColor.mouseOnColor);
                    }
                };
                if(initConfig.mode != "AlertTip"){
                    // 保存原来的状态
                    var tipjq = $("#"+tip);
                    this.lastshowclass = tipjq.attr("class");
                    this.lastshowmsg = tipjq.text();
                    $.formValidator.setTipState(this,"onFocus",setting.onFocus);
                };
                if(this.validatorPasswordIndex > 0){$("#"+setting.pwdTipID).show();jqobj.trigger('keyup');}
            });
            // 按键时候触发校验
            jqobj.bind("keyup",function(){
                if(!setting.bind){return}
                if(this.validatorPasswordIndex > 0)
                {
                    try{
                        var returnObj = $.formValidator.oneIsValid(id);
                        var level = $.formValidator.passwordValid(this);
                        if(level < 0){level=0};
                        if(!returnObj.isValid){level = 0};
                        $("#"+setting.pwdTipID).show();
                        $("#"+setting.pwdTipID).html(passwordStrengthStatusHtml[level]);
                    }catch(e)
                    {
                        alert("密码强度校验失败,错误原因:变量passwordStrengthStatusHtml语法错误或者为设置)");
                    }
                }
            });
            // 注册失去焦点的事件。进行校验，改变提示对象的文字和样式；出错就提示处理
            jqobj.bind(setting.triggerEvent, function(){
                if(!setting.bind){return}
                var settings = this.settings;
                // 根据配置截掉左右的空格
                if(settings[0].leftTrim){this.value = this.value.replace(/^\s*/g, "")}
                if(settings[0].rightTrim){this.value = this.value.replace(/\s*$/g, "")}
                // 恢复默认值
                if(isInputControl){
                    if(this.value == "" && showText != ""){this.value = showText}
                    if(this.value == showText){jqobj.css("color",setting.onShowTextColor.mouseOutColor)}
                }
                // 进行有效性校验
                var returnObj = $.formValidator.oneIsValid(id);
                if(returnObj==null){return}
                if(returnObj.ajax >= 0)
                {
                    $.formValidator.showAjaxMessage(returnObj);
                }
                else
                {
                    var showmsg = $.formValidator.showMessage(returnObj);
                    if(!returnObj.isValid)
                    {
                        // 自动修正错误
                        var auto = setting.autoModify && isInputControl;
                        if(auto)
                        {
                            $(this).val(this.validValueOld);
                            if(initConfig.mode != "AlertTip"){
                                $.formValidator.setTipState(this,"onShow",$.formValidator.getStatusText(this,setting.onCorrect))
                            };
                        }
                        else
                        {
                            if(initConfig.forceValid || setting.forceValid){
                                intiConfig.onAlert(showmsg);this.focus();
                            }
                        }
                    }
                }
            });
        }
        else if (srcTag == "select")
        {
            jqobj.bind({
                // 获得焦点
                focus: function(){
                    if(!setting.bind){return}
                    if (initConfig.mode != "AlertTip") {
                        $.formValidator.setTipState(this, "onFocus", setting.onFocus)
                    };
                },
                // 失去焦点
                blur: function(){
                    if(!setting.bind){return}
                    if(this.validValueOld==undefined || this.validValueOld==jqobj.val()){$(this).trigger("change")}
                },
                // 选择项目后触发
                change: function(){
                    if(!setting.bind){return}
                    var returnObj = $.formValidator.oneIsValid(id);
                    if(returnObj==null){return;}
                    if ( returnObj.ajax >= 0){
                        $.formValidator.showAjaxMessage(returnObj);
                    }else{
                        $.formValidator.showMessage(returnObj);
                    }
                }
            });
        }
    });
}; 

$.fn.inputValidator = function(controlOptions)
{
    var settings = {};
    $.extend(true, settings, inputValidator_setting, controlOptions || {});
    return this.each(function() {
        $.formValidator.appendValid(this.id,settings);
    });
};

$.fn.compareValidator = function(controlOptions)
{
    var settings = {};
    $.extend(true, settings, compareValidator_setting, controlOptions || {});
    return this.each(function(){
        $.formValidator.appendValid(this.id,settings);
    });
};

$.fn.regexValidator = function(controlOptions)
{
    var settings = {};
    $.extend(true, settings, regexValidator_setting, controlOptions || {});
    return this.each(function(){
        $.formValidator.appendValid(this.id,settings);
    });
};

$.fn.functionValidator = function(controlOptions)
{
    var settings = {};
    $.extend(true, settings, functionValidator_setting, controlOptions || {});
    return this.each(function(){
        $.formValidator.appendValid(this.id,settings);
    });
};

$.fn.ajaxValidator = function(controlOptions)
{
    var settings = {};
    $.extend(true, settings, ajaxValidator_setting, controlOptions || {});
    return this.each(function()
    {
        var initConfig = $("body").data(this.validatorGroup);
        if($.inArray(this,initConfig.ajaxObjects) == -1)
        {
            initConfig.ajaxObjects.push(this);
        }
        this.validatorAjaxIndex = $.formValidator.appendValid(this.id,settings);
    });
};

$.fn.passwordValidator = function(controlOptions)
{
    // 默认配置
    var settings = {};
    $.extend(true, settings, passwordValidator_setting, controlOptions || {});
    return this.each(function()
    {
        this.validatorPasswordIndex = $.formValidator.appendValid(this.id,settings);
    });
};

// 指定控件显示通过或不通过样式
$.fn.defaultPassed = function(onShow)
{
    return this.each(function()
    {
        var settings = this.settings;
        settings[0].defaultPassed = true;
        this.onceValided = true;
        for ( var i = 1 ; i < settings.length ; i ++ )
        {
            settings[i].isValid = true;
            if(!($("body").data(settings[0].validatorGroup).mode == "AlertTip")){
                this.lastshowclass = onShow ? "onShow" : "onCorrect";
                this.lastshowmsg = onShow ? settings[0].onShow : settings[0].onCorrect;
                $.formValidator.setTipState(this,this.lastshowclass, this.lastshowmsg);
            }
        }
    });
};
// 删除字符串左右两端的空格
 function trim(str){ 
   return str.replace(/(^\s*)|(\s*$)/g, "");
 }
// 指定控件不参加校验
$.fn.unFormValidator = function(unbind)
{
    return this.each(function()
    {
        if(this.settings)
        {
            this.settings[0].bind = !unbind;
            if(unbind){
                $("#"+this.settings[0].tipID).hide();
            }else{
                $("#"+this.settings[0].tipID).show();
            }
        }
    });
};

// 显示漂浮显示层
$.fn.showTooltips = function()
{
    if($("body [id=fvtt]").length==0){
        fvtt = $("<div id='fvtt' style='position:absolute;z-index:56002'></div>");
        $("body").append(fvtt);
        fvtt.before("<iframe index=0 src='about:blank' class='fv_iframe' scrolling='no' frameborder='0'></iframe>");

    }
    return this.each(function()
    {
        jqobj = $(this);
        s = $("<span class='top' id=fv_content style='display:block'></span>");
        b = $("<b class='bottom' style='display:block' />");
        this.tooltip = $("<span class='fv_tooltip' style='display:block'></span>").append(s).append(b).css({"filter":"alpha(opacity:95)","KHTMLOpacity":"0.95","MozOpacity":"0.95","opacity":"0.95"});
        // 注册事件
        jqobj.bind({
            mouseover : function(e){
                $("#fvtt").empty().append(this.tooltip).show();
                $("#fv_content").html(this.Tooltip);
                $.formValidator.localTooltip(e);
            },
            mouseout : function(){
                $("#fvtt").hide();
            },
            mousemove: function(e){
                $.formValidator.localTooltip(e);
            }
        });
    });
}
}( jQuery ) );


var initConfig_setting = 
{
    theme:"Default",
    validatorGroup : "1",						// 分组号
    formID:"",					// 表单ID
    submitButtonID:"",			// 提交按钮ID
    submitOnce:false,							// 页面是否提交一次，不会停留
    ajaxForm : null,       // 如果不为null，表示整个表单ajax提交
    mode : "FixTip",			// 显示模式
    errorFocus:true,			// 第一个错误的控件获得焦点
    wideWord:true,				// 一个汉字当做2个长
    forceValid:false,							// 控件输入正确之后，才允许失去焦
    debug:false,								// 调试模式点
    inIframe:false,
    onSuccess: function() {return true},		// 提交成功后的回调函数
    onError: $.noop,						// 提交失败的回调函数度
    onAlert: function() {alert(arguments[0])},
    status:"",					// 提交的状态：submited、sumbiting、sumbitingWithAjax
    ajaxPrompt :"",	// 控件失去焦点后，触发ajax校验，没有返回结果前的错误提示数
    ajaxCountSubmit:0,		// 提交的时候触发的ajax验证个数
    ajaxCountValid:0,		// 失去焦点时候触发的ajax验证个数
    validObjects:[],							// 参加校验的控件集合
    ajaxObjects:[],							// 传到服务器的控件列表
    showTextObjects:"",
    validateType : "initConfig",
    offsetChrome : {left:42,top:0},
    oneByOneVerify : false
};

var formValidator_setting = 
{
    validatorGroup : "1",
    onShowText : "",
    onShowTextColor:{mouseOnColor:"#000000",mouseOutColor:"#999999"},
    onShowFixText:"",
    onShow :"请输入内容",
    onFocus: "请输入内容",
    onCorrect: "输入正确",
    onEmpty: "输入内容为空",
    empty :false,
    autoModify : false,
    defaultValue : null,
    bind : true,
    ajax : false,
    validateType : "formValidator",
    tipCss :
    {
        left:10,
        top:-4,
        height:20,
        width:280
    },
    triggerEvent:"blur",
    forceValid : false,
    tipID : null,
    pwdTipID : null,
    fixTipID : null,
    relativeID : null,
    index : 0,
    leftTrim : false,
    rightTrim : false
};

var inputValidator_setting = 
{
    isValid : false,
    type : "size",
    min : 0,
    max : 99999,
    onError:"输入错误",
    validateType:"inputValidator",
    empty:{leftEmpty:true,rightEmpty:true,leftEmptyError:null,rightEmptyError:null}
};

var compareValidator_setting = 
{
    isValid : false,
    desID : "",
    operateor :"=",
    onError:"输入错误",
    validateType:"compareValidator"
};

var regexValidator_setting = 
{
    isValid : false,
    regExp : "",
    param : "i",
    dataType : "string",
    compareType : "||",
    onError:"输入的格式不正确",
    validateType:"regexValidator"
};

var ajaxForm_setting = 
{
    type : "GET",
    url : window.location.href,
    dataType : "html",
    timeout : 100000,
    data : null,
    type : "GET",
    async : true,
    cache : false,
    buttons : null,
    beforeSend : function(){return true;},
    success : function(){return true;},
    complete : $.noop,
    processData : true,
    error : $.noop
};

var ajaxValidator_setting = 
{
    isValid : false,
    lastValid : "",
    oneceValid : false,
    randNumberName : "rand",
    onError:"服务器校验没有通过",
// onWait:"正在等待服务器返回数据",
    validateType:"ajaxValidator"
};
$.extend(true,ajaxValidator_setting,ajaxForm_setting);

var functionValidator_setting = 
{
    isValid : true,
    fun : function(){this.isValid = true;},
    validateType:"functionValidator",
    onError:"输入错误"
};

var passwordValidator_setting = {
    isValid : true,
    compareID : "",
    validateType:"passwordValidator",
    onErrorContinueChar:"密码字符为连续字符不被允许",
    onErrorSameChar:"密码字符都相同不被允许",
    onErrorCompareSame:"密码于用户名相同不被允许"
};

var fv_scriptSrc = document.getElementsByTagName('script')[document.getElementsByTagName('script').length - 1].src;
/*******************************************************************************
 * jm 将所有的srcjo.val() 改为 trim(srcjo.val()) 并且添加了trim() 方法
 ******************************************************************************/

 /** ***************************** */
var regexEnum = 
{
    intege:"^-?[1-9]\\d*$",					// 整数
    intege1:"^[1-9]\\d*$",					// 正整数
    intege2:"^-[1-9]\\d*$",					// 负整数
    num:"^([+-]?)\\d*\\.?\\d+$",			// 数字
    num1:"^[1-9]\\d*|0$",					// 正数（正整数 + 0）
    num2:"^-[1-9]\\d*|0$",					// 负数（负整数 + 0）
    decmal:"^([+-]?)\\d*\\.\\d+$",			// 浮点数
    decmal1:"^[1-9]\\d*.\\d*|0.\\d*[1-9]\\d*$",// 正浮点数
    decmal2:"^-([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*)$",// 负浮点数
    decmal3:"^-?([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*|0?.0+|0)$",// 浮点数
    decmal4:"^[1-9]\\d*.\\d*|0.\\d*[1-9]\\d*|0?.0+|0$",// 非负浮点数（正浮点数 + 0）
    decmal5:"^(-([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*))|0?.0+|0$",// 非正浮点数（负浮点数 +
																// 0）
    email:"^\\w+((-\\w+)|(\\.\\w+))*(-)*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$", // 邮件
    color:"^[a-fA-F0-9]{6}$",				// 颜色
    url:"^http[s]?:\\/\\/([\\w-]+\\.)+[\\w-]+([\\w-./?%&=]*)?$",	// url
    chinese:"^[\\u4E00-\\u9FA5\\uF900-\\uFA2D]+$",					// 仅中文
    ascii:"^[\\x00-\\xFF]+$",				// 仅ACSII字符
    zipcode:"^\\d{6}$",						// 邮编
    mobile:"^(13[0-9]{9}|15[0123456789][0-9]{8}|18[0123456789][0-9]{8}|147[0-9]{8}|177[0-9]{8}$)",				// 手机
    ip4:"^(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)$",	// ip地址
    notempty:"^\\S+$",						// 非空
    picture:"(.*)\\.(jpg|bmp|gif|ico|pcx|jpeg|tif|png|raw|tga)$",	// 图片
    rar:"(.*)\\.(rar|zip|7zip|tgz)$",								// 压缩文件
    date:"^\\d{4}(\\-|\\/|\.)\\d{1,2}\\1\\d{1,2}$",					// 日期
    qq:"^[1-9]*[1-9][0-9]*$",				// QQ号码
    tel:"^(([0\\+]\\d{2,3}-)?(0\\d{2,3})-)?(\\d{7,8})(-(\\d{3,}))?$",	// 电话号码的函数(包括验证国内区号,国际区号,分机号)
    username:"^\\w+$",						// 用来用户注册。匹配由数字、26个英文字母或者下划线组成的字符串
    letter:"^[A-Za-z]+$",					// 字母
    letter_u:"^[A-Z]+$",					// 大写字母
    letter_l:"^[a-z]+$",					// 小写字母
    idcard:"^[1-9]([0-9]{14}|[0-9]{17})$",	// 身份证
    charnum_eg:"^[a-zA-Z]+[a-zA-Z0-9_]*$",		// 以字母开始的字母数字下划线
    charnum_e:"[a-zA-Z0-9_]*$"		// 以字母开始的字母数字下划线
}

var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"} 

function isCardID(sId){ 
    var iSum=0 ;
    var info="" ;
    if(!/^\d{17}(\d|x)$/i.test(sId)) return "你输入的身份证长度或格式错误";
    sId=sId.replace(/x$/i,"a");
    if(aCity[parseInt(sId.substr(0,2))]==null) return "你的身份证地区非法";
    sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2));
    var d=new Date(sBirthday.replace(/-/g,"/")) ;
    if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))return "身份证上的出生日期非法";
    for(var i = 17;i>=0;i --) iSum += (Math.pow(2,i) % 11) * parseInt(sId.charAt(17 - i),11) ;
    if(iSum%11!=1) return "你输入的身份证号非法";
    return true;// aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"男":"女")
} 
function checkPhone(phone){
	  var reg=/^1[3|4|5|7|8]\d{9}$/;
	  if( (reg.test(phone)))
	  {
	  	return true;
	  }else{
	  	return "手机号码格式不正确";
	  }
}
// 短时间，形如 (13:04:06)
function isTime(str)
{
    var a = str.match(/^(\d{1,2})(:)?(\d{1,2})\2(\d{1,2})$/);
    if (a == null) {return false}
    if (a[1]>24 || a[3]>60 || a[4]>60)
    {
        return false;
    }
    return true;
}

// 短日期，形如 (2003-12-05)
function isDate(str)
{
    var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
    if(r==null)return false;
    var d= new Date(r[1], r[3]-1, r[4]);
    return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
}

// 长时间，形如 (2003-12-05 13:04:06)
function isDateTime(str)
{
    var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
    var r = str.match(reg);
    if(r==null) return false;
    var d= new Date(r[1], r[3]-1,r[4],r[5],r[6],r[7]);
    return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]&&d.getHours()==r[5]&&d.getMinutes()==r[6]&&d.getSeconds()==r[7]);
}

function creditCard(str) {
    // spaces and dashes may be valid characters, but must be stripped to
	// calculate the checksum.
    var valid = false,
    cardNumber = str.replace(/ +/g, '').replace(/-+/g, '');
    var numDigits = cardNumber.length;
    if (numDigits >= 14 && numDigits <= 19 && parseInt(cardNumber) > 0) {

        var sum = 0, i = numDigits - 1, pos = 1, digit, luhn = new String();
        do {
            digit = parseInt(cardNumber.charAt(i));
            luhn += (pos++ % 2 == 0) ? digit * 2 : digit;
        } while (--i >= 0)

        for (i = 0; i < luhn.length; i++) {
            sum += parseInt(luhn.charAt(i));
        }
        valid = sum % 10 == 0;
    }
    return valid;
}

function ck1pwd(str, id){
    var pwd = $('#'+id).val();
    if(str == ''){
        return false;
    } else {
        if (pwd != '' ) {
            if (str == pwd) {
                return true;
            } else {
                return false;
            }
        }
    }
}

function ck2pwd(str, id){
    var pwd = $('#'+id).val();
    if(str == ''){
        return false;
    } else {
        if (pwd == ''){
            return false;
        } else {
            if (str == pwd) {
                return true;
            } else {
                return false;
            }
        }
    }
}
/** ******* creatAlertWindow.js*************************** */


function submit() {
    $('#Subtn').attr('disabled',"disabled");
    var data;
    var act;
    if ($('#formID').length>0){
        data = $("#formID").serialize();
        act = $("#formID").attr('action');
    } else {
        data = $("#form").serialize();
        act = $("#form").attr('action');
    }
    myOpera(data, act, '');
}
// 获取表单框数据
function getFormStr(act, title) {
    $.ajax({
        type : 'post',
        url : act,
        dataType : 'json',
        data : '',
        success:function(json) {
            if (json.result) {
                var form = {'title':title, 'form':json.html};
                var formWindow = createFormWindow(form, false);
                var minwidth = false;
                if(title == '修改评价') {
                    minwidth = 450;
                }
                initForm(formWindow, minwidth);
                formWindow.dialog('open');
            } else {
                var resultConfirm;
                resultConfirm = CreateResultWindow(json, 'result-confirm');
                InitResultWindow(resultConfirm, '');
                var txt_h = $("#result_msg").outerHeight();
                var icon_h = $('#r_icon').outerHeight();
                var m_h = (txt_h - icon_h)/2;
                if (m_h > 5 ) {
                    m_h = m_h - 5;
                }
                $('#r_icon').css('margin-top', m_h);
            }
        }
    });
}

/**
 * *****************************************---START OPERA---
 * **************************************************
 */
/** Ajax 提交处理* */
function myOpera(data, act, confirmWindow) {
    if (confirmWindow.length!=0) {
        confirmWindow.dialog("close");
    }

    openShowBox("正在处理，请稍候。。。");
    $.ajax({
        type : 'post',
        url : act,
        dataType : 'json',
        data : data,
        success:function(json) {
            $('#Subtn').removeAttr("disabled");
            closeShowBox();
            var html = '';
            html = (typeof(json.html)!="undefined" && json.html != '');

            if (typeof(json.act)=="undefined") {
                if (html) {
                    $('#jsonhtml').html(json.html);
                } else {
                    if (typeof(json.msg) != 'undefined' || typeof(json.msg) != '') {  // opera
																						// sucess
																						// ,show
																						// message
                        var resultConfirm;
                        resultConfirm = CreateResultWindow(json, 'result-confirm');
                        InitResultWindow(resultConfirm, confirmWindow,json);
                        var txt_h = $("#result_msg").outerHeight();
                        var icon_h = $('#r_icon').outerHeight();
                        var m_h = (txt_h - icon_h)/2;
                        if (m_h > 5 ) {
                            m_h = m_h - 5;
                        }
                        $('#r_icon').css('margin-top', m_h);
                    }
                }
            } else {
                if (typeof(json.url) != 'undefined' && json.url !='' && !(json.url === false || json.url === true)){
                    setTimeout(function(){location.replace(json.url);},2000);
                    return;
                }
                var title = '提  示';
                if (typeof(json.title)!='undefined' && json.title!='') {
                    title = json.title;
                }

                if (typeof(json.type)=="undefined" || json.type=='') {
                    var alertMsg = {"flag":1, "winId":"confirm-Window", "act": json.act,"url":json.url, 'msg':json.msg,'title':title };
                    var ConfirmWindow = CreateConfirmWindow(alertMsg, true);
                    InitConfirmWindow(ConfirmWindow, true);
                    var txt_h = $("#confirm_msg").outerHeight();
                    var aicon_h = $('#a_icon').outerHeight();
                    var m_h = (txt_h - aicon_h)/2;
                    if (m_h > 5 ) {
                        m_h = m_h - 5;
                    }
                    $('#a_icon').css('margin-top', m_h);
                } else {
                    var form = {'title':title, 'form':json.form};
                    var formWindow = createFormWindow(form, true);
                    if (title == '我要竞标' || title == '创建计划') {
                        formWindow.dialog({
                            autoOpen : true,
                            minWidth : 600,
                            modal : true,
                            draggable : false,
                            buttons : {
                            },
                            closeOnEscape : true
                        });
                    } else {
                        formWindow.dialog({
                            autoOpen : true,
                            minWidth : 300,
                            modal : true,
                            draggable : false,
                            buttons : {
                                '确定':function() {
                                    var act = $('#formID').attr('action');
                                    var data = $("#formID").serialize();
                                    myOpera(data, act, formWindow);
                                },
                                '取消':function(){
                                    formWindow.dialog('close');
                                }
                            },
                            closeOnEscape : true
                        });
                    }
                }
            }

            if( json.result && !html) {
                if (json.url === false || json.url === true) {
                    return false;
                } else {
                    if (typeof(json.msg) != 'undefined' || typeof(json.msg) != '') {
                        if(typeof(json.hasConfirm)!='undefined' ){
                        ;
                        }else{
                            if (typeof(json.url)!="undefined" && json.url != '') {
                            setTimeout(function() { location.replace(json.url); }, 2000);
                        } else {
                            setTimeout(function() { location.reload(); }, 2000);
                        }
                        }
                    } else {
                        if (typeof(json.url)!="undefined" && json.url != '') {
                            location.replace(json.url);
                        } else {
                            location.reload();
                        }
                    }
                }
            }
// else{ //jm added in 2014/05/26
// if (typeof(json.url)!="undefined" && json.url != '') {
// setTimeout(function(){location.replace(json.url);},2000);
// // location.replace(json.url);
// }
// }
        },
    error:function(){
        closeShowBox();
        location.reload();
// var title='提示';
// var msg='刷新失败，或网络不稳定';
// var alertMsg = {"flag":1, "winId":"confirm-Window", "act":'',"url":'',
// 'msg':msg,'title':title };
// var ConfirmWindow = CreateConfirmWindow(alertMsg, true);
// InitConfirmWindow(ConfirmWindow, true);
// var txt_h = $("#confirm_msg").outerHeight();
// var aicon_h = $('#a_icon').outerHeight();
// var m_h = (txt_h - aicon_h)/2;
// if (m_h > 5 ) {
// m_h = m_h - 5;
// }
// $('#a_icon').css('margin-top', m_h);
    }
    });
}
/**
 * *****************************************---END OPERA---
 * **************************************************
 */

/**
 * *****************************************---START CONFORM WINDOW---
 * **************************************************
 */
/**
 * 创建Confirm Window
 * 
 * @param {Object}
 *            args
 * @param {Object}
 *            res
 */
function CreateConfirmWindow(args, res) {
    var winId = 'confirm-Window';
    var title = '提  示';
    var flag = 0;
    var msg = args.msg;
    var action = args.act;
    var cls;
    var icon_id = 'd_icon';
    var postform = 0;
    if (args.winId) {
        winId = args.winId;
    }

    if (args.postform) {
        postform = args.postform;
    }

    if (args.flag) {
        flag = args.flag;
    }

    if (args.title) {
        title = args.title;
    }

    if (res) {
        cls = 'icon_info_success';
        icon_id = 'a_icon';
    } else if (res === false) {
        cls = 'icon_info_error';
        icon_id = 'a_icon';
    } else {
        cls = 'icon_info_b';
    }

    if ($('#' + winId).length > 0) {
        $('.ui-dialog-title').html(title);
        $('#' + winId + ' #confirm_msg').html(msg);
        $('#' + winId + ' #confirmaction').html(action);
        $('#' + winId + ' #isgotoaction').html(flag);
        $('#' + winId + ' #postform').html(postform);
    } else {
        var confirmWindow = '<div id="' + winId + '" title="' + title + '" style="display:none; height:45px;">';
        confirmWindow += '<span id="confirmaction" style="display:none;">' + action + '</span>';
        confirmWindow += '<span id="isgotoaction" style="display:none;">' + flag + '</span>';
        confirmWindow += '<span id="postform" style="display:none;">' + postform + '</span>';
        confirmWindow += '<span id="'+ icon_id +'" class="dialog_icon '+ cls +'"></span><div class="dialog_f_d" id="confirm_msg">' + msg + '</div></div>';
        $(confirmWindow).appendTo("body");
    }
    return $("#" + winId);
}

/**
 * 初始化确认窗口
 * 
 * @param {Object}
 *            confirmWindow
 * @param {Object}
 *            flag
 * @param {Object}
 *            goact
 */
function InitConfirmWindow(confirmWindow, flag, goact) {
    var autoopen = false;
    if (flag) {
        autoopen = true;
    }
    confirmWindow.dialog({
        autoOpen: autoopen,
        minHeight: 50,
        modal : true,
        draggable : false,
        closeOnEscape: true,
        buttons : {
            '确  定' : function() {
                HandleConfirmWindow(confirmWindow);
            },
            '取  消' : function() {
                if (goact === true) {
                    HandleConfirmWindow(confirmWindow);
                } else {
                    confirmWindow.dialog("close");
                }
            }
        }
    });
}

/** 处理Redirect Window* */
function HandleConfirmWindow(confirmWindow) {
    confirmWindow.dialog("close");
    var confirmaction = confirmWindow.find('#confirmaction');
    var isgotoaction = confirmWindow.find('#isgotoaction');
    var postform = confirmWindow.find('#postform');
    var data = '';
    var action = confirmaction.html();
    if (isgotoaction.html() == 1) {
        // openShowBox('正在跳转，请稍候。。。');
        location.replace(action);
        return;
    }

    if (postform.html() == 1) {
        data = $("#formID").serialize();
    }
    myOpera(data, action, confirmWindow);
}
/**
 * *****************************************---END CONFORM WINDOW---
 * **************************************************
 */

/**
 * *****************************************---START RESULT WINDOW---
 * **************************************************
 */
/** 创建Result Window* */
function CreateResultWindow(obj, winName) {
    var title = '提  示';
    var winId = 'result-confirm';
    var cls = 'icon_info_error';
    if (winName) {
        winId = winName;
    }

    if (obj.title) {
        title = obj.title;
    }

    if (obj.result===true) {
        cls = 'icon_info_success';
    } else {
        if (obj.result == 'ques') {
            cls = 'icon_info_b';
        }
    }

    if ($('#' + winName).length > 0) {
        $('.ui-dialog-title').html(title);
        $('#' + winId + ' #result_msg').html(obj.msg);
        $('#' + winId + ' .dialog_icon').removeClass("icon_info_error icon_info_success");
        $('#' + winId + ' .dialog_icon').addClass(cls);
    } else {
        var resultWindow = '<div id="' + winId + '" title="' + title + '" style="display:none; height:45px;">';
        resultWindow += '<span id="r_icon" class="dialog_icon '+ cls +'"></span><div class="dialog_f_d" id="result_msg">' + obj.msg + '</div></div>';
        $(resultWindow).appendTo("body");
    }
    return $("#" + winId);
}

/** 初始化Result Window * */
/*******************************************************************************
 * @param {Object}
 *            confirmWindow
 * @param {Object}
 *            other like result-confirm,confirm-Window
 */
function InitResultWindow(confirmWindow, other,json) {
    confirmWindow.dialog({
        autoOpen : true,
        minHeight : 50,
        modal : true,
        draggable : false,
        closeOnEscape : true,
        buttons : {
            '确  定' : function() {
                $(this).dialog("close");
                if (other.length > 0) {
                    if(other.attr('id')=='confirm-Window') {
                        location.reload();
                    } else {
                        if (other.attr('id')!='form-Window')
                        {
                            if (other.attr('id') == 'form-win')
                            {
                                if (json.result) {
                                    if(typeof(json.hasConfirm)!='undefined' ){
                                        if(typeof(json.url) && json.url!='' ){
                                        location.replace(json.url);
                                    }else{
                                        location.reload();
                                      }
                                    }
                                }else {
                                    other.dialog('open');
                                }
                            } else {
                                initForm(other, false);
                                if(json.result &&typeof(json.hasConfirm)!='undefined' ){
                                    if(typeof(json.url) && json.url!='' ){
                                        location.replace(json.url);
                                    }else{
                                        location.reload();
                                    }
                                }else{
                                  other.dialog('open');
                                }
                            }
                        }
                    }
                }else{
                    if(typeof(json.url)!='undefined' &&  json.url ){
                        location.replace(json.url);
                    }
                }
            }
        }
    });
}
/** *********************** ---END RESULT WINDOW--- ************************ */

/**
 * *****************************************---START FORM WINDOW---
 * **************************************************
 */
/** 创建 Alert Form* */
function createFormWindow(obj, flag) {
    var title = '提  示';
    var winId;
    if (flag) {
        winId = 'form-win';
    } else {
        winId = 'form-confirm';
    }

    var formcontent = obj.form;
    if (obj.winId) {
        winId = obj.winId;
    }

    if (obj.title) {
        title = obj.title;
    }

    if ($('#' + winId).length > 0) {
        $('.ui-dialog-title').html(title);
        $('#' + winId + ' #formDiv').html(formcontent);
    } else {
        var formWindow = '<div id="' + winId + '" style="display: none;" title="'+title+'"><div id="formDiv">' + formcontent + '</div></div>';
        $(formWindow).appendTo("body");
    }

    if ($("#qixian").length > 0) {
        var date = $("#qixian").val();
        $("#qixian").datepicker($.datepicker.regional["zh"]);
        $("#qixian").datepicker("option", "minDate", new Date());
        if (date != '') {
            $("#qixian").val(date);
        }
    }

    var confirmWindow = $("#" + winId);

    $('#ok').on('click',function() {
        var act = $('#formID').attr('action');
        var data = $("#formID").serialize();
        myOpera(data, act, confirmWindow);
    });

    $('#cancle').on('click',function() {
        $('#' + winId).dialog('close');
    });
    return confirmWindow;
}

/** 初始化 Alert Form* */
function initForm(alertWindow, minwidth) {
    if (!minwidth) {
        minwidth = 600;
    }

    alertWindow.dialog({
        autoOpen : false,
        minWidth : minwidth,
        modal : true,
        draggable : false,
        buttons : {},
        closeOnEscape : true
    });
}
/**
 * 弹出提示框
 * 
 * @param {Object}
 *            msg 提示内容
 * @param {Object}
 *            type 提示类型
 */
function userInforWin(msg,type,winId,no_cancle_button){
    var title = '温馨提示';
// var winId = 'NeedRepay-confirm';
    var cls = 'icon_info_b';
    if ($('#' + winId).length > 0) {
        $('.ui-dialog-title').html(title);
        $('#' + winId + ' #result_msg').html(msg);
        $('#' + winId + ' .dialog_icon').removeClass("icon_info_error icon_info_success");
        $('#' + winId + ' .dialog_icon').addClass(cls);
    } else {
        var resultWindow = '<div id="' + winId + '" title="' + title + '" style="display:none; height:45px;">';
        resultWindow += '<span id="r_icon" class="dialog_icon '+ cls +'"></span><div class="dialog_f_d" id="result_msg">' + msg + '</div></div>';
        $(resultWindow).appendTo("body");
    }
    var needRepayWindow = $('#' + winId);
    if(no_cancle_button){
       needRepayWindow.dialog({
        autoOpen : true,
        minHeight : 50,
        modal : true,
        draggable : false,
        closeOnEscape : true,
        buttons : {
            '确  定' : function() {
                $(this).dialog("close");
            }
        }
    });
    }else {
        needRepayWindow.dialog({
        autoOpen : true,
        minHeight : 50,
        modal : true,
        draggable : false,
        closeOnEscape : true,
        buttons : {
            '确  定' : function() {
                $(this).dialog("close");
                if(type=='user_info'){
                    var url='/my/user/modifydetail';
                }else if(type=='user_level'){
                    var url='/my/user/user_level';
                }else if(type=='awards'){
                    var url='/my/user/';
                }
                if(url!='undefined' && url ){
                    location.replace(url);
                }
            },
        '取消':function(){
            $(this).dialog("close");
            }
        }
    });
    }
    var pay_txt_h = $("#result_msg").outerHeight();
    var pay_icon_h = $('#r_icon').outerHeight();
    var pay_m_h = (pay_txt_h - pay_icon_h)/2;
    $('#r_icon').css('margin-top', pay_m_h);
}

function createNeedRepay() {
    var title = '温馨提示';
    var winId = 'NeedRepay-confirm';
    var cls = 'icon_info_b';
    var msg = "您在老站项目中尚有未分配的项目款，这部分款项在新站将无法分配使用，是否现在撤出这些款项？";

    if ($('#' + winId).length > 0) {
        $('.ui-dialog-title').html(title);
        $('#' + winId + ' #result_msg').html(msg);
        $('#' + winId + ' .dialog_icon').removeClass("icon_info_error icon_info_success");
        $('#' + winId + ' .dialog_icon').addClass(cls);
    } else {
        var resultWindow = '<div id="' + winId + '" title="' + title + '" style="display:none; height:45px;">';
        resultWindow += '<span id="r_icon" class="dialog_icon '+ cls +'"></span><div class="dialog_f_d" id="result_msg">' + msg + '</div></div>';
        $(resultWindow).appendTo("body");
    }
    var needRepayWindow = $('#' + winId);

    needRepayWindow.dialog({
        autoOpen : true,
        minHeight : 50,
        modal : true,
        draggable : false,
        closeOnEscape : true,
        buttons : {
            '确  定' : function() {
                $(this).dialog("close");
                createNeedRepayList();
            }
        }
    });
    var pay_txt_h = $("#result_msg").outerHeight();
    var pay_icon_h = $('#r_icon').outerHeight();
    var pay_m_h = (pay_txt_h - pay_icon_h)/2;
    $('#r_icon').css('margin-top', pay_m_h);
}

function createNeedRepayList(){
    $.ajax({
        type : 'post',
        url : '/my/user/getneedrepaylist',
        dataType : 'text',
        data : '',
        success:function(text) {
            var winId = 'form-win';
            var title = '撤出项目余款';
            var formcontent = text;
            if ($('#' + winId).length > 0) {
                $('.ui-dialog-title').html(title);
                $('#' + winId + ' #formDiv').html(formcontent);
            } else {
                var formWindow = '<div id="' + winId + '" style="display: none;" title="'+title+'"><div id="formDiv">' + formcontent + '</div></div>';
                $(formWindow).appendTo("body");
            }
            $('.needrepaydiv .confirm').on('click', function() {
                var action = $(this).attr('act');
                myOpera('', action, '');
            });
            $('#' + winId).dialog({
                autoOpen : true,
                minWidth : 600,
                modal : true,
                draggable : false,
                buttons : {},
                closeOnEscape : true
            });
        }
    });
}
/**
 * *****************************************---END FORM WINDOW---
 * **************************************************
 */

/**
 * ***************************************** --- ShowBox ---
 * ****************************************************
 */
/**
 * 打开提示窗口
 * 
 * @param {显示内容}
 *            msg
 */
function openShowBox(msg) {	
    var overlay = '<div class=overlay></div>';
    var AjaxLoading = '<div id="AjaxLoading" class=showbox><div class=loadingWord>';
        AjaxLoading += '<img src=/images/waiting.gif><span id=loadingwordmsg>';
        AjaxLoading += '加载中，请稍候。。。</span></div></div>';

    if (!($('.overlay').length > 0)) {
        $(overlay).appendTo("body");
    }

    if (!($('#AjaxLoading').length > 0)) {
        $(AjaxLoading).appendTo("body");
    }

    var wh = $(window).height();
    var ww = $(window).width();

    var scrollTop = $(document).scrollTop();
    var scrollLeft = $(document).scrollLeft();
    var top = (wh - $(".showbox").height())/2 + scrollTop;
    var left = (ww - $(".showbox").width())/2 + scrollLeft;
    $(".overlay").css({'display':'block', 'opacity' : 0.3});
    $(".showbox").css({'top':top, 'left':left});
    if(msg!='') {
        $('#loadingwordmsg').html(msg);
    }
    $(".showbox").show();
}

function closeShowBox() {
    $(".showbox").hide();
    $(".overlay").hide();
}
/**
 * ***************************************** --- ShowBox ---
 * ****************************************************
 */
