using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(JSPROJECTS.Startup))]
namespace JSPROJECTS
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
