<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoSocio.aspx.cs" Inherits="TPC.ListadoSocio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       
 <!DOCTYPE html>
 <html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <h2>Listado de socios</h2> 
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
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
</head>
 <body>
     
     <div class="container py-3">
         

         <!-- Apareceran los socios con 3 dias antes del vencimiento a los cuales se los contactaran por correo -->
        <asp:GridView ID="gvSocios" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="IdSocio"
    CssClass="table table-dark table-striped table-hover text-center"
    BorderStyle="None">
    <Columns>
        <asp:BoundField DataField="IdSocio" HeaderText="#" />
        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
        <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
        <asp:BoundField DataField="Correo" HeaderText="Correo" />
        <asp:BoundField DataField="FechaVencimiento" HeaderText="Vencimiento" DataFormatString="{0:dd MMM yyyy}" />
        <asp:TemplateField HeaderText="Historial de pagos">
            <ItemTemplate>
                <asp:Button ID="btnVer" runat="server" Text="Ver" CssClass="btn btn-custom btn-sm" OnClick="btnVer_Click" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

     </div>



 </body>
 </html>

</asp:Content>
