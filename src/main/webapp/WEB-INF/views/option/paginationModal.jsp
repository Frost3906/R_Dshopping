<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="align-items: center">
      <div class="modal-header">
        <h5 class="modal-title">Page Move</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Please enter the page number you want to move.</p>
        <p style="text-align: center;">1 ~ ${productAmt}</p>
      </div>
      <div>
      	<input type="number" min="1" max="${productAmt}" name="pageNumSel" id="pageNumSel" placeholder="Number Only" style="width: 120px;"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary page-sel-move" data-dismiss="modal">Move</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>