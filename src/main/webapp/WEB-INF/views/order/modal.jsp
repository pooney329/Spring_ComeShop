<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 모달 헤더 -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">신용카드 결제 모듈</h4>
						</div>

						<!-- 모달 바디 -->
						<div class="modal-body">
							<form method="post" id="insert_form">
								<label>카드번호</label> <input type="text" name="cardnumber"
									id="name" class="form-control" /> <br /> <input type="submit"
									name="insert" id="insert" value="결제	" class="btn btn-success" />

							</form>
						</div>

						<!-- 모달 풋터 -->
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
