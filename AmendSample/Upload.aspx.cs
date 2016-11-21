﻿using CloudAmend;
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
        Amend am = new Amend();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void btnUpload_Click(object sender, EventArgs e)
        {
            byte[] fileBytes = fileUpload.FileBytes;
            Amend.SetAmendName("saurabh");
            Amend.SetCredentials("e9235337-d113-4c28-b0ff-b924396655b0", "2357bbaa302e7ede07712ba0cadb1f34");
            Amend.AmendResponse resp = await am.UploadAsync(fileBytes);
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
            Amend.SetAmendName("saurabh");
            Amend.SetCredentials("e9235337-d113-4c28-b0ff-b924396655b0", "2357bbaa302e7ede07712ba0cadb1f34");
            Amend.AmendResponse resp = await am.UploadAsync(image);
            if (resp.StatusCode == 200)
            {
                Response.Redirect("ImageProcess.aspx?ImageId=" + resp.ImageName);
            }
        }
    }
}