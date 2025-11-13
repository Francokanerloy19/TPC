<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoSocio.aspx.cs" Inherits="TPC.ListadoSocio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h2>Listado de socios</h2>


    <style>
        body {
            background-color: #0d1117;
            color: #e6edf3;
        }

        .btn-custom {
            background-color: #238636;
            border: none;
        }
    </style>

    <br />
    <asp:Button ID="btnAgregar" runat="server" Text="Agregar nuevo socio" CssClass="btn btn-custom btn-sm" OnClick="btnAgregar_Click" />
    <br />
    <br />
    <div class="d-flex" role="search">
        <asp:TextBox ID="txtSearch" placeholder="Search" CssClass="form-control me-2 bg-dark text-white border-0"   aria-label="Search" runat="server" />
        <asp:Button ID="btnSearch" Text="Search" CssClass="btn btn-outline-success" runat="server"  OnClick="btnSearch_Click"/>
        <br />
        <br />
        <asp:Label ID="lblErrorSearch" CssClass=" text-danger" runat="server" />
      </div>
    <div class="container py-3">



        <asp:GridView ID="gvSocios" runat="server" AutoGenerateColumns="False" DataKeyNames="IdSocio" CssClass="table table-dark table-striped table-hover text-center" BorderStyle="None" OnRowCommand="gvSocios_RowCommand">
            <Columns>
                <asp:BoundField DataField="IdSocio" HeaderText="#" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" />

                <asp:TemplateField HeaderText="Estado">
                    <ItemTemplate><%# Convert.ToBoolean(Eval("Estado")) ? "<span style='color:limegreen;font-size:1.5rem;'>✅</span>"  : "<span style='color:red;font-size:1.5rem;'>❌</span>" %> </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Gestion">
                    <ItemTemplate>
                        <asp:Button ID="btnGestion" runat="server" Text="Gestionar" CssClass="btn btn-custom btn-sm" CommandName="GestionarSocio" CommandArgument='<%# Eval("IdSocio") %>' />

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>





</asp:Content>
