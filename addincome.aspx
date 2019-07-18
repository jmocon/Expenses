<%@ Page Title="Add Income - Expenses" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addincome.aspx.cs" Inherits="addincome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div class="row">
    <div class="col-12">
      <h3>Add New Income</h3>
    </div>
  </div>
  <div class="row">
    <div class="col-6 offset-3">
      <div class="card shadow py-2">
        <div class="card-body">
          <div class="row">
            <div class="col-12" runat="server" id="divNotif">
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <label class="form-control-plaintext">Category</label>
              <select class="form-control" runat="server" id="selCategory" name="category"></select>
              <label class="form-control-plaintext">Amount</label>
              <input type="number" class="form-control" runat="server" id="txtAmount" name="amount" />
              <button class="btn btn-primary mt-4 col-6 offset-3" runat="server" id="btnSubmit" onserverclick="btnSubmit_ServerClick">Submit</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsHolder" runat="Server">
</asp:Content>