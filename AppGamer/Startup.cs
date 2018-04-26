using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AppGamer.Startup))]
namespace AppGamer
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
