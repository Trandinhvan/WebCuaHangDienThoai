using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebDT.Startup))]
namespace WebDT
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
