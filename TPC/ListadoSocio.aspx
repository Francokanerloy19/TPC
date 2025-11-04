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
    <div class="container py-3">



        <asp:GridView ID="gvSocios" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="IdSocio"
            CssClass="table table-dark table-striped table-hover text-center"
            BorderStyle="None">
            <Columns>
                <asp:BoundField DataField="IdSocio" HeaderText="#" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" />

                <asp:TemplateField HeaderText="Gestion">
                    <ItemTemplate>
                        <asp:Button ID="btnGestion" runat="server" Text="Gestionar" CssClass="btn btn-custom btn-sm" OnClick="btnGestion_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        
    </div>





</asp:Content>
