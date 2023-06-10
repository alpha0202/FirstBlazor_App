using FirstBlazor_App.Data;
using Microsoft.AspNetCore.ResponseCompression;
using System.Data;
using System.Data.SqlClient;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();

var dbConnectionString = builder.Configuration.GetConnectionString("conexionPredeterminada");
builder.Services.AddSingleton<IDbConnection>((sp) => new SqlConnection(dbConnectionString));

//inyeccción mi propio dependencia
builder.Services.AddScoped<IContactRepository, ContactRepository>();



var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseWebAssemblyDebugging();
}
else
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseBlazorFrameworkFiles();
app.UseStaticFiles();

app.UseRouting();


app.MapRazorPages();
app.MapControllers();
app.MapFallbackToFile("index.html");

app.Run();
