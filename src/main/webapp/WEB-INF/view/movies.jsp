<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resource/bootstrap.css">
<script type="text/javascript" src="/resource/jquery-3.2.1.js"></script>
<title>电影的列表</title>
<script type="text/javascript">

		function qx() {
			$(".ck").attr("checked",true);
		}
		function fx() {
			$(".ck").each(function() {
				this.checked=!this.checked;
			})
		}
		function qbx() {
			$(".ck").attr("checked",false);
		}
		function choose(own){
			$("[name=check]").attr("checked",own.checked);
		}
		
	function morder(orderName){
		var orderMethod='${movieVO.orderMethod}';
		orderMethod=orderMethod=='asc'?'desc':'asc';
		location="/selects?orderName="+orderName+"&orderMethod="+orderMethod;
	}
	
	function ps(){
		var num=$("[name=check]:checked").length;
		if(num==0){
			alert("请选择要删除的数据")
			return ;
		}else{
			var sids=$("[name=check]:checked").map(function(){
				return this.value;
			}).get().join();
			alert(sids);
			$.post("delete",{sids:sids},function(flag){
				if(flag){
					alert("删除成功")
					location="selects";
				}else{
					alert("删除失败")
				}
				
			})
		}
		
		
		
	}
	
	function fenye(pageNum){
		$("[name=pageNum]").val(pageNum);
		$("form").submit();
	}
	
	
	
</script>
</head>
<body>
<form action="/selects" method="post">
	<input type="hidden" name="pageNum">
	影片名称:<input type="text" name="name" value="${movieVOs.name}"> &nbsp;&nbsp;&nbsp;&nbsp; 上映时间:<input type="text" name="t1" value="${movieVOs.t1}">---<input type="text" name="t2" value="${movieVOs.t2}"><br>
	导演<input type="text" name="actor" value="${movieVOs.actor}"> &nbsp;&nbsp;&nbsp;&nbsp; 价格:<input type="text" name="p1" value="${movieVOs.p1}">---<input type="text" name="p2" value="${movieVOs.p2}"><br>
	电影年代<input type="text" name="years" value="${movieVOs.years}"> &nbsp;&nbsp;&nbsp;&nbsp; 电影时长:<input type="text" name="l1" value="${movieVOs.l1}">---<input type="text" name="l2" value="${movieVOs.l2}"><br>
	<button type="submit" class="btn btn-info">查看</button>
	<input type="button" class="btn btn-info" onclick="ps()" value="批量删除">
	<input type="button" class="btn btn-info" onclick="qx()" value="全选">
	<input type="button" class="btn btn-info" onclick="fx()" value="反选">
	<input type="button" class="btn btn-info" onclick="qbx()" value="全不选">
	
</form>
	
	<table>
		<tr>
			<td><input type="checkbox" onclick="choose(this)"></td>
			<td>序号</td>
			<td>电影名称</td>
			<td>导演</td>
			<td><a href="javascript:morder('price')">价格</a></td>
			<td>上映日期</td>
			<td><a href="javascript:morder('longtime')">电影时长</a></td>
			<td><a href="javascript:morder('years')">年代</a></td>
			<td>类型</td>
			<td>区域</td>
			<td>状态</td>

		</tr>
		<c:forEach items="${movies }" var="movie" varStatus="i">
			
			<tr>
				<td><input type="checkbox" class="ck" name="check" value="${movie.id }"></td>
				<td>${i.count+page.startRow-1 }</td>
				<td>${movie.name }</td>
				<td>${movie.actor }</td>
				<td>${movie.price }</td>
				<td>${movie.uptime }</td>
				<td>${movie.longtime }</td>
				<td>${movie.years }</td>
				<td>${movie.type }</td>
				<td>${movie.area }</td>
				<td>${movie.status }</td>
			</tr>
	

		</c:forEach>
		<tr>
			<td colspan="10">
				<button onclick="fenye(1)">首页</button>
				<button onclick="fenye(${page.prePage==0?'1':page.prePage})">上一页</button>
				<button onclick="fenye(${page.nextPage==0?page.pages:page.nextPage})">下一页</button>
				<button onclick="fenye(${page.pages})">尾页</button>
			</td>
		</tr>

	</table>
</body>
</html>