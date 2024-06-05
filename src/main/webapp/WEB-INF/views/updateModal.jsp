<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal fade mar" id="staticBackdrop${param.empNo}"
	data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h2 class="modal-title" id="staticBackdropLabel">資料修改</h2>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form id="updateEmpForm${param.empNo}" method="post"
				action="${pageContext.request.contextPath}/update/${param.empNo}">
				<div class="modal-body">
						<label for="name">Name:</label> <input
							class="form-control form-control-lg" type="text" name="name"
							value="${param.empName}" placeholder="Enter name" autofocus />
						<label for="email">Email:</label> <input
							class="form-control form-control-lg" type="text" name="email"
							value="${param.empEmail}" placeholder="Enter email" autofocus />
						<label for="mobile">Mobile:</label> <input
							class="form-control form-control-lg" type="text" name="mobile"
							value="${param.empMobile}" placeholder="Enter mobile" autofocus />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary"
						onclick="sendRequest(get('updateEmpForm${param.empNo}'))">確定</button>
				</div>
			</form>
		</div>
	</div>
</div>