<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

    <style>
        .table-responsive {
            text-align: center;
        }

        .modal-body {
            text-align: start;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header-left">
            <div class="dashboard_bar" id="pagename" style="font-size:42px;">CRUD DEMO</div>
        </div>
    </div>

    <!-- 表單 -->
    <div class="card card-body">
        <form action="${pageContext.request.contextPath}/insert" method="post" onsubmit="return sendRequest(this);">
            <div class="form-row">
                <fieldset class="form-group col-md-2">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" placeholder="Enter name" name="name" required="required">
                </fieldset>
                <fieldset class="form-group col-md-3">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control" placeholder="Enter email" name="email" required="required">
                </fieldset>
                <fieldset class="form-group col-md-3">
                    <label for="mobile">Mobile:</label>
                    <input type="text" class="form-control" placeholder="Enter mobile" name="mobile" required="required">
                </fieldset>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">新增</button>
            </div>
        </form>
    </div>

    <!-- 資料表 -->
    <div class="card card-body table-responsive">
        <table class="table card-table default-table display mb-4 dataTablesCard table-responsive-xl" id="example4">
            <thead>
                <tr>
                    <th>#</th>
                    <th class="col-md-2">姓名</th>
                    <th class="col-md-3">信箱</th>
                    <th class="col-md-2">電話</th>
                    <th class="col-md-2">加入時間</th>
                    <th class="col-md-1"></th>
                    <th class="col-md-1"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${entityList}" var="entity" varStatus="tr">
                    <tr>
                        <td><div>${tr.count}</div></td>
                        <td><div>${entity.name}</div></td>
                        <td><div>${entity.email}</div></td>
                        <td><div>${entity.mobile}</div></td>
                        <td>
                            <div>
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${entity.createdDate}" />
                            </div>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop${entity.id}">修改</button>
                            <jsp:include page="updateModal.jsp">
                                <jsp:param name="empNo" value="${entity.id}" />
                                <jsp:param name="empName" value="${entity.name}" />
                                <jsp:param name="empEmail" value="${entity.email}" />
                                <jsp:param name="empMobile" value="${entity.mobile}" />
                            </jsp:include>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/delete/${entity.id}" class="btn btn-primary">刪除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- JavaScript & DataTable 初始化 -->
    <script src="vendor/global/global.min.js"></script>
    <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <script>
        $(document).ready(function () {
            // 設定頁面標題
            $("#pagename").text("CRUD DEMO");

            // 初始化 DataTable
            if (!$.fn.DataTable.isDataTable('#example4')) {
                $('#example4').DataTable({
                    "pageLength": 20,
                    "lengthMenu": [5, 10, 20, 50, 100],
                    "language": {
                        "lengthMenu": "顯示 _MENU_ 條",
                        "zeroRecords": "找不到符合的記錄",
                        "info": "顯示第 _PAGE_ 頁，共 _PAGES_ 頁",
                        "infoEmpty": "無符合條目",
                        "infoFiltered": "(從 _MAX_ 條記錄中篩選)",
                        "paginate": {
                            "first": "第一頁",
                            "last": "最後一頁",
                            "next": "下一頁",
                            "previous": "上一頁"
                        },
                        "search": "搜尋:"
                    }
                });
            }

            // 自動聚焦在 modal 中的第一個帶有 autofocus 的元素
            $(document).on('shown.bs.modal', function() {
            	$(this).find('[autofocus]').focus();
        	});
    	});
		// header標題
		$("#pagename").text("TEST");

		function sendRequest(object) {

			let name = object.elements['name'].value;
			let email = object.elements['email'].value;
			let mobile = object.elements['mobile'].value;
            const namexp = /^[\u4E00-\u9FA5]{2,4}$/;
            const emailxp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            const mobilexp = /^09[0-9]{8}$/;

			if (name === '' || email === '' || mobile === '') {
				Swal.fire("修改作業失敗", "欄位不得為空", "error");
				return false;
			} else if (!emailxp.test(email)) {
				Swal.fire("修改作業失敗", "信箱格式錯誤,請重新確認", "error");
				return false;
			} else if (!mobilexp.test(mobile)) {
				Swal.fire("修改作業失敗", "手機格式錯誤,請重新確認", "error");
				return false;
			} else
				object.submit();
		}

		function get(id) {
			return document.getElementById(id);
		}
	</script>
</body>
</html>