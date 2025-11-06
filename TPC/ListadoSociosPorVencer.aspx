<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoSociosPorVencer.aspx.cs" Inherits="TPC.ListadoSociosPorVencer" %>

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
    <asp:Button ID="volver" runat="server" Text="volver" CssClass="btn btn-outline-danger btn-lg" OnClick="volver_Click" />

    <div class="container py-3">



        <asp:GridView ID="gvSocios" runat="server" AutoGenerateColumns="False" DataKeyNames="IdSocio" CssClass="table table-dark table-striped table-hover text-center" BorderStyle="None" OnRowCommand="gvSocios_RowCommand">
            <Columns>
                <asp:BoundField DataField="IdSocio" HeaderText="#" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                <asp:BoundField DataField="Correo" HeaderText="Correo" />
                <asp:BoundField DataField="inscripcion.FechaVencimiento" HeaderText="Vencimiento" DataFormatString="{0:dd MMM yyyy}" />
            </Columns>
        </asp:GridView>

    </div>
</asp:Content>
