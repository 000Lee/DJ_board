<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/mngr/template/header.jsp" flush="true">
		<jsp:param value="USER EXTRA INFO POPUP" name="headerTitle"/>
	</jsp:include>
</head>
<body>
	<div class="row">
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<form id="userExtraFrm" name="userExtraFrm">
			<input type="hidden" id="userUUID" name="userUUID" value="${userUUID}"/>
			<c:set var="mode" value="write"/>
			<c:if test="${userExtraInfoVO ne null}">
			<c:set var="mode" value="update"/>
			<input type="hidden" id="userExtraInfoUUID" name="userExtraInfoUUID" value="${userExtraInfoVO.userExtraInfoUUID}"/>
			<input type="hidden" id="mode" name="mode" value="${mode}"/>
			</c:if>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo1">userExtraInfo1</label>
					<input type="text" class="form-control" id="userExtraInfo1" name="userExtraInfo1" value="${userExtraInfoVO.userExtraInfo1}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo2">userExtraInfo2</label>
					<input type="text" class="form-control" id="userExtraInfo2" name="userExtraInfo2" value="${userExtraInfoVO.userExtraInfo2}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo3">userExtraInfo3</label>
					<input type="text" class="form-control" id="userExtraInfo3" name="userExtraInfo3" value="${userExtraInfoVO.userExtraInfo3}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo4">userExtraInfo4</label>
					<input type="text" class="form-control" id="userExtraInfo4" name="userExtraInfo4" value="${userExtraInfoVO.userExtraInfo4}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo5">userExtraInfo5</label>
					<input type="text" class="form-control" id="userExtraInfo5" name="userExtraInfo5" value="${userExtraInfoVO.userExtraInfo5}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo6">userExtraInfo6</label>
					<input type="text" class="form-control" id="userExtraInfo6" name="userExtraInfo6" value="${userExtraInfoVO.userExtraInfo6}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo7">userExtraInfo7</label>
					<input type="text" class="form-control" id="userExtraInfo7" name="userExtraInfo7" value="${userExtraInfoVO.userExtraInfo7}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo8">userExtraInfo8</label>
					<input type="text" class="form-control" id="userExtraInfo8" name="userExtraInfo8" value="${userExtraInfoVO.userExtraInfo8}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo9">userExtraInfo9</label>
					<input type="text" class="form-control" id="userExtraInfo9" name="userExtraInfo9" value="${userExtraInfoVO.userExtraInfo9}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo10">userExtraInfo10</label>
					<input type="text" class="form-control" id="userExtraInfo10" name="userExtraInfo10" value="${userExtraInfoVO.userExtraInfo10}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo11">userExtraInfo11</label>
					<input type="text" class="form-control" id="userExtraInfo11" name="userExtraInfo11" value="${userExtraInfoVO.userExtraInfo11}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo12">userExtraInfo12</label>
					<input type="text" class="form-control" id="userExtraInfo12" name="userExtraInfo12" value="${userExtraInfoVO.userExtraInfo12}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo13">userExtraInfo13</label>
					<input type="text" class="form-control" id="userExtraInfo13" name="userExtraInfo13" value="${userExtraInfoVO.userExtraInfo13}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo14">userExtraInfo14</label>
					<input type="text" class="form-control" id="userExtraInfo14" name="userExtraInfo14" value="${userExtraInfoVO.userExtraInfo14}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo15">userExtraInfo15</label>
					<input type="text" class="form-control" id="userExtraInfo15" name="userExtraInfo15" value="${userExtraInfoVO.userExtraInfo15}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo16">userExtraInfo16</label>
					<input type="text" class="form-control" id="userExtraInfo16" name="userExtraInfo16" value="${userExtraInfoVO.userExtraInfo16}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo17">userExtraInfo17</label>
					<input type="text" class="form-control" id="userExtraInfo17" name="userExtraInfo17" value="${userExtraInfoVO.userExtraInfo17}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo18">userExtraInfo18</label>
					<input type="text" class="form-control" id="userExtraInfo18" name="userExtraInfo18" value="${userExtraInfoVO.userExtraInfo18}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo19">userExtraInfo19</label>
					<input type="text" class="form-control" id="userExtraInfo19" name="userExtraInfo19" value="${userExtraInfoVO.userExtraInfo19}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo20">userExtraInfo20</label>
					<input type="text" class="form-control" id="userExtraInfo20" name="userExtraInfo20" value="${userExtraInfoVO.userExtraInfo20}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo21">userExtraInfo21</label>
					<input type="text" class="form-control" id="userExtraInfo21" name="userExtraInfo21" value="${userExtraInfoVO.userExtraInfo21}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo22">userExtraInfo22</label>
					<input type="text" class="form-control" id="userExtraInfo22" name="userExtraInfo22" value="${userExtraInfoVO.userExtraInfo22}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo23">userExtraInfo23</label>
					<input type="text" class="form-control" id="userExtraInfo23" name="userExtraInfo23" value="${userExtraInfoVO.userExtraInfo23}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo24">userExtraInfo24</label>
					<input type="text" class="form-control" id="userExtraInfo24" name="userExtraInfo24" value="${userExtraInfoVO.userExtraInfo24}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo25">userExtraInfo25</label>
					<input type="text" class="form-control" id="userExtraInfo25" name="userExtraInfo25" value="${userExtraInfoVO.userExtraInfo25}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo26">userExtraInfo26</label>
					<input type="text" class="form-control" id="userExtraInfo26" name="userExtraInfo26" value="${userExtraInfoVO.userExtraInfo26}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo27">userExtraInfo27</label>
					<input type="text" class="form-control" id="userExtraInfo27" name="userExtraInfo27" value="${userExtraInfoVO.userExtraInfo27}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo28">userExtraInfo28</label>
					<input type="text" class="form-control" id="userExtraInfo28" name="userExtraInfo28" value="${userExtraInfoVO.userExtraInfo28}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo29">userExtraInfo29</label>
					<input type="text" class="form-control" id="userExtraInfo29" name="userExtraInfo29" value="${userExtraInfoVO.userExtraInfo29}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo30">userExtraInfo30</label>
					<input type="text" class="form-control" id="userExtraInfo30" name="userExtraInfo30" value="${userExtraInfoVO.userExtraInfo30}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo31">userExtraInfo31</label>
					<input type="text" class="form-control" id="userExtraInfo31" name="userExtraInfo31" value="${userExtraInfoVO.userExtraInfo31}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo32">userExtraInfo32</label>
					<input type="text" class="form-control" id="userExtraInfo32" name="userExtraInfo32" value="${userExtraInfoVO.userExtraInfo32}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo33">userExtraInfo33</label>
					<input type="text" class="form-control" id="userExtraInfo33" name="userExtraInfo33" value="${userExtraInfoVO.userExtraInfo33}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo34">userExtraInfo34</label>
					<input type="text" class="form-control" id="userExtraInfo34" name="userExtraInfo34" value="${userExtraInfoVO.userExtraInfo34}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo35">userExtraInfo35</label>
					<input type="text" class="form-control" id="userExtraInfo35" name="userExtraInfo35" value="${userExtraInfoVO.userExtraInfo35}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo36">userExtraInfo36</label>
					<input type="text" class="form-control" id="userExtraInfo36" name="userExtraInfo36" value="${userExtraInfoVO.userExtraInfo36}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo37">userExtraInfo37</label>
					<input type="text" class="form-control" id="userExtraInfo37" name="userExtraInfo37" value="${userExtraInfoVO.userExtraInfo37}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo38">userExtraInfo38</label>
					<input type="text" class="form-control" id="userExtraInfo38" name="userExtraInfo38" value="${userExtraInfoVO.userExtraInfo38}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfo39">userExtraInfo39</label>
					<input type="text" class="form-control" id="userExtraInfo39" name="userExtraInfo39" value="${userExtraInfoVO.userExtraInfo39}">
				</div>
				<div class="form-group">
					<label for="userExtraInfo40">userExtraInfo40</label>
					<input type="text" class="form-control" id="userExtraInfo40" name="userExtraInfo40" value="${userExtraInfoVO.userExtraInfo40}">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt1">userExtraInfoNoneCrypt1</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt1" name="userExtraInfoNoneCrypt1" value="${userExtraInfoVO.userExtraInfoNoneCrypt1}">
				</div>
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt2">userExtraInfoNoneCrypt2</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt2" name="userExtraInfoNoneCrypt2" value="${userExtraInfoVO.userExtraInfoNoneCrypt2}">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt3">userExtraInfoNoneCrypt3</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt3" name="userExtraInfoNoneCrypt3" value="${userExtraInfoVO.userExtraInfoNoneCrypt3}">
				</div>
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt4">userExtraInfoNoneCrypt4</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt4" name="userExtraInfoNoneCrypt4" value="${userExtraInfoVO.userExtraInfoNoneCrypt4}">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt5">userExtraInfoNoneCrypt5</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt5" name="userExtraInfoNoneCrypt5" value="${userExtraInfoVO.userExtraInfoNoneCrypt5}">
				</div>
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt6">userExtraInfoNoneCrypt6</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt6" name="userExtraInfoNoneCrypt6" value="${userExtraInfoVO.userExtraInfoNoneCrypt6}">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt7">userExtraInfoNoneCrypt7</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt7" name="userExtraInfoNoneCrypt7" value="${userExtraInfoVO.userExtraInfoNoneCrypt7}">
				</div>
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt8">userExtraInfoNoneCrypt8</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt8" name="userExtraInfoNoneCrypt8" value="${userExtraInfoVO.userExtraInfoNoneCrypt8}">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt9">userExtraInfoNoneCrypt9</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt9" name="userExtraInfoNoneCrypt9" value="${userExtraInfoVO.userExtraInfoNoneCrypt9}">
				</div>
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt10">userExtraInfoNoneCrypt10</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt10" name="userExtraInfoNoneCrypt10" value="${userExtraInfoVO.userExtraInfoNoneCrypt10}">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt11">userExtraInfoNoneCrypt11</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt11" name="userExtraInfoNoneCrypt11" value="${userExtraInfoVO.userExtraInfoNoneCrypt11}">
				</div>
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt12">userExtraInfoNoneCrypt12</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt12" name="userExtraInfoNoneCrypt12" value="${userExtraInfoVO.userExtraInfoNoneCrypt12}">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt13">userExtraInfoNoneCrypt13</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt13" name="userExtraInfoNoneCrypt13" value="${userExtraInfoVO.userExtraInfoNoneCrypt13}">
				</div>
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt14">userExtraInfoNoneCrypt14</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt14" name="userExtraInfoNoneCrypt14" value="${userExtraInfoVO.userExtraInfoNoneCrypt14}">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt15">userExtraInfoNoneCrypt15</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt15" name="userExtraInfoNoneCrypt15" value="${userExtraInfoVO.userExtraInfoNoneCrypt15}">
				</div>
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt16">userExtraInfoNoneCrypt16</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt16" name="userExtraInfoNoneCrypt16" value="${userExtraInfoVO.userExtraInfoNoneCrypt16}">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt17">userExtraInfoNoneCrypt17</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt17" name="userExtraInfoNoneCrypt17" value="${userExtraInfoVO.userExtraInfoNoneCrypt17}">
				</div>
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt18">userExtraInfoNoneCrypt18</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt18" name="userExtraInfoNoneCrypt18" value="${userExtraInfoVO.userExtraInfoNoneCrypt18}">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt19">userExtraInfoNoneCrypt19</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt19" name="userExtraInfoNoneCrypt19" value="${userExtraInfoVO.userExtraInfoNoneCrypt19}">
				</div>
				<div class="form-group">
					<label for="userExtraInfoNoneCrypt20">userExtraInfoNoneCrypt20</label>
					<input type="text" class="form-control" id="userExtraInfoNoneCrypt20" name="userExtraInfoNoneCrypt20" value="${userExtraInfoVO.userExtraInfoNoneCrypt20}">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoJoinUUID1">userExtraInfoJoinUUID1</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID1" name="userExtraInfoJoinUUID1" value="${userExtraInfoVO.userExtraInfoJoinUUID1}" maxlength="32">
				</div>
				<div class="form-group">
					<label for="userExtraInfoJoinUUID2">userExtraInfoJoinUUID2</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID2" name="userExtraInfoJoinUUID2" value="${userExtraInfoVO.userExtraInfoJoinUUID2}" maxlength="32">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoJoinUUID3">userExtraInfoJoinUUID3</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID3" name="userExtraInfoJoinUUID3" value="${userExtraInfoVO.userExtraInfoJoinUUID3}" maxlength="32">
				</div>
				<div class="form-group">
					<label for="userExtraInfoJoinUUID4">userExtraInfoJoinUUID4</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID4" name="userExtraInfoJoinUUID4" value="${userExtraInfoVO.userExtraInfoJoinUUID4}" maxlength="32">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoJoinUUID5">userExtraInfoJoinUUID5</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID5" name="userExtraInfoJoinUUID5" value="${userExtraInfoVO.userExtraInfoJoinUUID5}" maxlength="32">
				</div>
				<div class="form-group">
					<label for="userExtraInfoJoinUUID6">userExtraInfoJoinUUID6</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID6" name="userExtraInfoJoinUUID6" value="${userExtraInfoVO.userExtraInfoJoinUUID6}" maxlength="32">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoJoinUUID7">userExtraInfoJoinUUID7</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID7" name="userExtraInfoJoinUUID7" value="${userExtraInfoVO.userExtraInfoJoinUUID7}" maxlength="32">
				</div>
				<div class="form-group">
					<label for="userExtraInfoJoinUUID8">userExtraInfoJoinUUID8</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID8" name="userExtraInfoJoinUUID8" value="${userExtraInfoVO.userExtraInfoJoinUUID8}" maxlength="32">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoJoinUUID9">userExtraInfoJoinUUID9</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID9" name="userExtraInfoJoinUUID9" value="${userExtraInfoVO.userExtraInfoJoinUUID9}" maxlength="32">
				</div>
				<div class="form-group">
					<label for="userExtraInfoJoinUUID10">userExtraInfoJoinUUID10</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID10" name="userExtraInfoJoinUUID10" value="${userExtraInfoVO.userExtraInfoJoinUUID10}" maxlength="32">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoJoinUUID11">userExtraInfoJoinUUID11</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID11" name="userExtraInfoJoinUUID11" value="${userExtraInfoVO.userExtraInfoJoinUUID11}" maxlength="32">
				</div>
				<div class="form-group">
					<label for="userExtraInfoJoinUUID12">userExtraInfoJoinUUID12</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID12" name="userExtraInfoJoinUUID12" value="${userExtraInfoVO.userExtraInfoJoinUUID12}" maxlength="32">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoJoinUUID13">userExtraInfoJoinUUID13</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID13" name="userExtraInfoJoinUUID13" value="${userExtraInfoVO.userExtraInfoJoinUUID13}" maxlength="32">
				</div>
				<div class="form-group">
					<label for="userExtraInfoJoinUUID14">userExtraInfoJoinUUID14</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID14" name="userExtraInfoJoinUUID14" value="${userExtraInfoVO.userExtraInfoJoinUUID14}" maxlength="32">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoJoinUUID15">userExtraInfoJoinUUID15</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID15" name="userExtraInfoJoinUUID15" value="${userExtraInfoVO.userExtraInfoJoinUUID15}" maxlength="32">
				</div>
				<div class="form-group">
					<label for="userExtraInfoJoinUUID16">userExtraInfoJoinUUID16</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID16" name="userExtraInfoJoinUUID16" value="${userExtraInfoVO.userExtraInfoJoinUUID16}" maxlength="32">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoJoinUUID17">userExtraInfoJoinUUID17</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID17" name="userExtraInfoJoinUUID17" value="${userExtraInfoVO.userExtraInfoJoinUUID17}" maxlength="32">
				</div>
				<div class="form-group">
					<label for="userExtraInfoJoinUUID18">userExtraInfoJoinUUID18</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID18" name="userExtraInfoJoinUUID18" value="${userExtraInfoVO.userExtraInfoJoinUUID18}" maxlength="32">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoJoinUUID19">userExtraInfoJoinUUID19</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID19" name="userExtraInfoJoinUUID19" value="${userExtraInfoVO.userExtraInfoJoinUUID19}" maxlength="32">
				</div>
				<div class="form-group">
					<label for="userExtraInfoJoinUUID20">userExtraInfoJoinUUID20</label>
					<input type="text" class="form-control" id="userExtraInfoJoinUUID20" name="userExtraInfoJoinUUID20" value="${userExtraInfoVO.userExtraInfoJoinUUID20}" maxlength="32">
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt1">userExtraInfoInt1</label>
					<input type="text" class="form-control" id="userExtraInfoInt1" name="userExtraInfoInt1" value="${userExtraInfoVO.userExtraInfoInt1}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt2">userExtraInfoInt2</label>
					<input type="text" class="form-control" id="userExtraInfoInt2" name="userExtraInfoInt2" value="${userExtraInfoVO.userExtraInfoInt2}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt3">userExtraInfoInt3</label>
					<input type="text" class="form-control" id="userExtraInfoInt3" name="userExtraInfoInt3" value="${userExtraInfoVO.userExtraInfoInt3}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt4">userExtraInfoInt4</label>
					<input type="text" class="form-control" id="userExtraInfoInt4" name="userExtraInfoInt4" value="${userExtraInfoVO.userExtraInfoInt4}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt5">userExtraInfoInt5</label>
					<input type="text" class="form-control" id="userExtraInfoInt5" name="userExtraInfoInt5" value="${userExtraInfoVO.userExtraInfoInt5}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt6">userExtraInfoInt6</label>
					<input type="text" class="form-control" id="userExtraInfoInt6" name="userExtraInfoInt6" value="${userExtraInfoVO.userExtraInfoInt6}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt7">userExtraInfoInt7</label>
					<input type="text" class="form-control" id="userExtraInfoInt7" name="userExtraInfoInt7" value="${userExtraInfoVO.userExtraInfoInt7}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt8">userExtraInfoInt8</label>
					<input type="text" class="form-control" id="userExtraInfoInt8" name="userExtraInfoInt8" value="${userExtraInfoVO.userExtraInfoInt8}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt9">userExtraInfoInt9</label>
					<input type="text" class="form-control" id="userExtraInfoInt9" name="userExtraInfoInt9" value="${userExtraInfoVO.userExtraInfoInt9}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt10">userExtraInfoInt10</label>
					<input type="text" class="form-control" id="userExtraInfoInt10" name="userExtraInfoInt10" value="${userExtraInfoVO.userExtraInfoInt10}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt11">userExtraInfoInt11</label>
					<input type="text" class="form-control" id="userExtraInfoInt11" name="userExtraInfoInt11" value="${userExtraInfoVO.userExtraInfoInt11}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt12">userExtraInfoInt12</label>
					<input type="text" class="form-control" id="userExtraInfoInt12" name="userExtraInfoInt12" value="${userExtraInfoVO.userExtraInfoInt12}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt13">userExtraInfoInt13</label>
					<input type="text" class="form-control" id="userExtraInfoInt13" name="userExtraInfoInt13" value="${userExtraInfoVO.userExtraInfoInt13}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt14">userExtraInfoInt14</label>
					<input type="text" class="form-control" id="userExtraInfoInt14" name="userExtraInfoInt14" value="${userExtraInfoVO.userExtraInfoInt14}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt15">userExtraInfoInt15</label>
					<input type="text" class="form-control" id="userExtraInfoInt15" name="userExtraInfoInt15" value="${userExtraInfoVO.userExtraInfoInt15}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt16">userExtraInfoInt16</label>
					<input type="text" class="form-control" id="userExtraInfoInt16" name="userExtraInfoInt16" value="${userExtraInfoVO.userExtraInfoInt16}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt17">userExtraInfoInt17</label>
					<input type="text" class="form-control" id="userExtraInfoInt17" name="userExtraInfoInt17" value="${userExtraInfoVO.userExtraInfoInt17}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt18">userExtraInfoInt18</label>
					<input type="text" class="form-control" id="userExtraInfoInt18" name="userExtraInfoInt18" value="${userExtraInfoVO.userExtraInfoInt18}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt19">userExtraInfoInt19</label>
					<input type="text" class="form-control" id="userExtraInfoInt19" name="userExtraInfoInt19" value="${userExtraInfoVO.userExtraInfoInt19}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt20">userExtraInfoInt20</label>
					<input type="text" class="form-control" id="userExtraInfoInt20" name="userExtraInfoInt20" value="${userExtraInfoVO.userExtraInfoInt20}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt21">userExtraInfoInt21</label>
					<input type="text" class="form-control" id="userExtraInfoInt21" name="userExtraInfoInt21" value="${userExtraInfoVO.userExtraInfoInt21}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt22">userExtraInfoInt22</label>
					<input type="text" class="form-control" id="userExtraInfoInt22" name="userExtraInfoInt22" value="${userExtraInfoVO.userExtraInfoInt22}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt23">userExtraInfoInt23</label>
					<input type="text" class="form-control" id="userExtraInfoInt23" name="userExtraInfoInt23" value="${userExtraInfoVO.userExtraInfoInt23}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt24">userExtraInfoInt24</label>
					<input type="text" class="form-control" id="userExtraInfoInt24" name="userExtraInfoInt24" value="${userExtraInfoVO.userExtraInfoInt24}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt25">userExtraInfoInt25</label>
					<input type="text" class="form-control" id="userExtraInfoInt25" name="userExtraInfoInt25" value="${userExtraInfoVO.userExtraInfoInt25}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt26">userExtraInfoInt26</label>
					<input type="text" class="form-control" id="userExtraInfoInt26" name="userExtraInfoInt26" value="${userExtraInfoVO.userExtraInfoInt26}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt27">userExtraInfoInt27</label>
					<input type="text" class="form-control" id="userExtraInfoInt27" name="userExtraInfoInt27" value="${userExtraInfoVO.userExtraInfoInt27}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt28">userExtraInfoInt28</label>
					<input type="text" class="form-control" id="userExtraInfoInt28" name="userExtraInfoInt28" value="${userExtraInfoVO.userExtraInfoInt28}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-row">
				<div class="form-group">
					<label for="userExtraInfoInt29">userExtraInfoInt29</label>
					<input type="text" class="form-control" id="userExtraInfoInt29" name="userExtraInfoInt29" value="${userExtraInfoVO.userExtraInfoInt29}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
				<div class="form-group">
					<label for="userExtraInfoInt30">userExtraInfoInt30</label>
					<input type="text" class="form-control" id="userExtraInfoInt30" name="userExtraInfoInt30" value="${userExtraInfoVO.userExtraInfoInt30}" maxlength="5" onkeyup="checkRegexpValue('n',this)">
				</div>
			</div> 
			
			<div class="form-group">
				<button type="button" id="btnSave" name="btnSave" class="btn btn-default">등록</button>
				<button type="button" id="btnDelete" name="btnDelete" class="btn btn-default">삭제</button>
				<button type="button" id="btnClose" name="btnClose" class="btn btn-default">닫기</button>
			</div>
			</form>	
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/common/commonForm.jsp" flush="true"></jsp:include>
	<script type="text/javascript">
		$(function(){
			$("#btnSave").on("click", function(e){
				e.preventDefault();
				fn_save();
			});
			
			$("#btnDelete").on("click", function(e){
				e.preventDefault();
				fn_delete();
			});
			
			$("#btnClose").on("click", function(e){
				e.preventDefault();
				self.close();
			});
		});
		
		// 추가정보 저장
		function fn_save() {
			
			var comSubmit = new ComSubmit("userExtraFrm");
			if($("#mode").val() == 'update'){
				comSubmit.setUrl("/mngr/user/extra/update.do");
			} else {
				comSubmit.setUrl("/mngr/user/extra/save.do");
			}
			comSubmit.submit();
		}
		
		// 추가정보 삭제
		function fn_delete() {
			if($("#mode").val() == 'update'){
				
				if(confirm("사용자 추가정보를 삭제하시겠습니까?")){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("/mngr/user/extra/delete.do");
					comSubmit.addParam("userExtraInfoUUID",$("#userExtraInfoUUID").val());
					comSubmit.submit();
				} else false;
				
			}
		}
	</script>
</body>
</html>