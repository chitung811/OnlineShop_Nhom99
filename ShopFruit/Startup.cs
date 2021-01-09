using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ShopFruit.Startup))]
namespace ShopFruit
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
