<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Historial.aspx.cs" Inherits="TPC.Historial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Historial de Actividades</h2>

    <asp:GridView ID="gvLog1" runat="server" AutoGenerateColumns="False"
        CssClass="table table-dark table-striped table-hover text-center"
        BorderStyle="None"
        Visible="false">
        <Columns>
            <asp:BoundField DataField="Accion" HeaderText="Acción" />
            <asp:BoundField DataField="Tabla" HeaderText="Tabla" />
            <asp:BoundField DataField="IdRegistro" HeaderText="ID Registro" />
            <asp:BoundField DataField="NombreRegistro" HeaderText="Nombre" />
            <asp:BoundField DataField="Usuario" HeaderText="Usuario" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
        </Columns>
    </asp:GridView>

    <asp:GridView ID="gvLog2" runat="server" AutoGenerateColumns="False"
        CssClass="table table-dark table-striped table-hover text-center"
        BorderStyle="None"
        Visible="false">
        <Columns>
            <asp:BoundField DataField="Accion" HeaderText="Acción" />
            <asp:BoundField DataField="Tabla" HeaderText="Tabla" />
            <asp:BoundField DataField="IdRegistro" HeaderText="ID Registro" />
            <asp:BoundField DataField="NombreRegistro" HeaderText="Nombre" />
            <asp:BoundField DataField="Usuario" HeaderText="Usuario" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
        </Columns>
    </asp:GridView>
    <div>
        <asp:Button ID="btnVolver" Text="Volver" runat="server"  CssClass="btn btn-danger btn-lg px-4" OnClick="btnVolver_Click" />
    </div>

</asp:Content>
