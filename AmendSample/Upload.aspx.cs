using CloudAmend;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AmendSample
{
    public partial class Upload : System.Web.UI.Page
    {
        Amend amend = new Amend();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void btnUpload_Click(object sender, EventArgs e)
        {
            byte[] fileBytes = fileUpload.FileBytes;
            //Set your amend credentials

            //Amend.SetAmendName("Your-Amend-name");
            //Amend.SetCredentials("Your-Access-Key", "Your-Access-Secret");
            Amend.AmendResponse resp = await amend.UploadAsync(fileBytes);
            if (resp.StatusCode == 200)
            {
                Response.Redirect("ImageProcess.aspx?ImageId=" + resp.ImageName);
            }
        }

        protected void btnUploadUrl_Click(object sender, EventArgs e)
        {
            var imgUrl = txtUrl.Text.Trim();
            if (!string.IsNullOrEmpty(imgUrl))
            {
                Response.Redirect("ImageProcess.aspx?ImageUrl=" + imgUrl);
            }
        }

        protected async void btnUploadChoose_Click(object sender, EventArgs e)
        {
            var id = hfImgId.Value.ToString();
            var file = Server.MapPath("~/Images/" + id + ".jpg");
            byte[] image = System.IO.File.ReadAllBytes(file);
            //Set your amend credentials
            //Amend.SetAmendName("Your-Amend-name");
            //Amend.SetCredentials("Your-Access-Key", "Your-Access-Secret");
            Amend.AmendResponse resp = await amend.UploadAsync(image);
            if (resp.StatusCode == 200)
            {
                Response.Redirect("ImageProcess.aspx?ImageId=" + resp.ImageName);
            }
        }
    }
}