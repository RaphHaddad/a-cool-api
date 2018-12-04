using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;

namespace CoolApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CoolController : ControllerBase
    {
        [HttpGet]
        public ActionResult<string> Get()
        {
            return new OkObjectResult("Success");
        }

        [HttpPost]
        public ActionResult<string> Post()
        {
            return new OkObjectResult("Success");
        }
    }
}
