<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addfeedback.aspx.cs" Inherits="addFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="row">
    <div class="col-12">
      <h3>Feedback</h3>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-6 offset-lg-3">
      <div class="card shadow py-2">
        <div class="card-body">
          <div class="row">
            <div class="col-12" runat="server" id="divNotif">
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <label class="form-control-plaintext">Message (max 500 characters)</label>
              <textarea maxlength="500" class="form-control" runat="server" id="txtMessage" name="message" placeholder="Message" ></textarea>
              <button class="btn btn-primary mt-4 col-6 offset-3" runat="server" id="btnSubmit" onserverclick="btnSubmit_ServerClick">Submit</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsHolder" Runat="Server">
</asp:Content>

