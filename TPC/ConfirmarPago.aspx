<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfirmarPago.aspx.cs" Inherits="TPC.ConfirmarPago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container py-3">



        <asp:GridView ID="gvOrdenPago" runat="server" AutoGenerateColumns="False" CssClass="table table-dark table-striped table-hover text-center" BorderStyle="None">
            <Columns>

                <asp:BoundField DataField="Nombre" HeaderText="Membresia" />
                <asp:TemplateField HeaderText="Actividad Extra">

                    <ItemTemplate><%# Eval("actividadExtra.NombreActividad") %></ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="PrecioBase" HeaderText="Presio $" />
                <asp:TemplateField HeaderText="Precio Extra">

                    <ItemTemplate><%# Eval("actividadExtra.PrecioExtra") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Precio Final">

                    <ItemTemplate><%# Convert.ToDecimal(Eval("PrecioBase")) + Convert.ToDecimal(Eval("actividadExtra.PrecioExtra")) %></ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div class="text-center">
            <asp:Button Text="ConFirmar" ID="btnConFirmar" runat="server" CssClass="btn btn-success me-2"  OnClick="btnConFirmar_Click"/>
            <asp:Button Text="Cancelar" ID="btnCancelar" runat="server" CssClass="btn btn-danger" OnClick="btnCancelar_Click"/>
            <asp:Label ID="lil" runat="server" />
        </div>

    </div>
</asp:Content>
