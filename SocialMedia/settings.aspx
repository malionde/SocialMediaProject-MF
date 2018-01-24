<%@ Page Language="C#" AutoEventWireup="true" CodeFile="settings.aspx.cs" Inherits="settings" %>

<form id="form1" runat="server">
<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <h4 class="modal-title">General Settings</h4>
</div>
<div class="modal-body">
  <div class="row modal-row">
    <div class="col-sm-3">
        <label>EMail: </label>
    </div>
    <div class="col-sm-6">
        <asp:TextBox ID="TextBox1"  style="text-align:center;" placeholder="example@email.com" runat="server"></asp:TextBox>
    </div>
    <div class="col-sm-3">
      <a href="#" title="Edit Username"><i class="fa fa-pencil"   aria-hidden="true"></i> <i>Edit</i></a>
    </div>
  </div>
  <div class="row modal-row">
    <div class="col-sm-3">
      <p>
       <label>Age: </label>
      </p>
    </div>
    <div class="col-sm-6">
      <p>
          <asp:TextBox ID="TextBox2" style="text-align:center;" placeholder="Age" runat="server"></asp:TextBox>
      </p>
    </div>
    <div class="col-sm-3">
      <p>
        <a href="#" title="Edit Email"><i class="fa fa-pencil" aria-hidden="true"></i> <i>Edit</i></a>
      </p>
    </div>
  </div>
  <div class="row modal-row">
    <div class="col-sm-3">
      <p>
          <label>Hobbies: </label>
      </p>
    </div>
    <div class="col-sm-6">
      <p>
          <asp:TextBox ID="TextBox3"  style="text-align:center;" placeholder="Hobbies"  runat="server"></asp:TextBox>
        </p>
    </div>
    <div class="col-sm-3">
      <a href="#" title="Edit Password"><i class="fa fa-pencil" aria-hidden="true"></i> <i>Edit</i></a>
    </div>
  </div>
  <div class="row modal-row">
    <div class="col-sm-3">
      <p>
        <label>Studies: </label>
      </p>
    </div>
    <div class="col-sm-6">
      <p>
          <asp:TextBox ID="TextBox4"  style="text-align:center;" placeholder="Studies" runat="server"></asp:TextBox>
        </p>
    </div>
    <div class="col-sm-3">
      <a href="#" title="Edit Language"><i class="fa fa-pencil" aria-hidden="true"></i> <i>Edit</i></a>
    </div>
  </div>
      <div class="row modal-row">
    <div class="col-sm-3">
      <p>
        <label>Job: </label>
      </p>
    </div>
    <div class="col-sm-6">
      <p>
          <asp:TextBox ID="TextBox5"  style="text-align:center;" placeholder="Job" runat="server"></asp:TextBox>
        </p>
    </div>
    <div class="col-sm-3">
      <a href="#" title="Edit Language"><i class="fa fa-pencil" aria-hidden="true"></i> <i>Edit</i></a>
    </div>
  </div>
      <div class="row modal-row">
    <div class="col-sm-3">
      <p>
        <label>Description: </label>
      </p>
    </div>
    <div class="col-sm-6">
      <p>
          <asp:TextBox ID="TextBox6" style="text-align:center;" placeholder="Description"  runat="server"></asp:TextBox>
        </p>
    </div>
    <div class="col-sm-3">
      <a href="#" title="Edit Language"><i class="fa fa-pencil" aria-hidden="true"></i> <i>Edit</i></a>
    </div>
  </div>
      <div class="row modal-row">
    <div class="col-sm-3">
      <p>
        <label>Password: </label>
      </p>
    </div>
    <div class="col-sm-6">
      <p>
          <asp:TextBox ID="TextBox7" style="text-align:center;" placeholder=" ****************************"  runat="server"></asp:TextBox>
        </p>
    </div>
    <div class="col-sm-3">
      <a href="#" title="Edit Language"><i class="fa fa-pencil" aria-hidden="true"></i> <i>Edit</i></a>
    </div>
  </div>
  
  <div class="row modal-row">
    <div class="col-sm-3">
      <p>
       <label>Notifications Email: </label>
     </p>
    </div>
    <div class="col-sm-6">
      <input class="switch-checkbox" type="checkbox" name="NotificationsEmail" data-on-text="Yes" data-off-text="No" checked>
    </div>
    <div class="col-sm-3">
    </div>
  </div>
</div>
<div class="modal-footer">
  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    <asp:button runat="server" class="btn btn-social" text="Save changes" OnClick="Unnamed1_Click" />

</div>

    </form>