using CloudAmend;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AmendSample
{
    public partial class ImageProcess : System.Web.UI.Page
    {
        string ImageId = string.Empty;
        string ImageUrl = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ImageId"] != null)
            {
                ImageId = Request.QueryString["ImageId"].ToString();
                ImageUrl = string.Empty;
            }
            else if (Request.QueryString["ImageUrl"] != null)
            {
                ImageUrl = Request.QueryString["ImageUrl"].ToString();
                ImageId = string.Empty;
            }
            else
            {
                Response.Redirect("Upload.aspx");
            }
        }

        protected void btnGet_Click(object sender, EventArgs e)
        {

            AmendOptions op = new AmendOptions();
            AmendTransform amTransform = new AmendTransform();
            //Transformation
            if (!string.IsNullOrEmpty(txtWidth.Text) && !string.IsNullOrEmpty(txtHeight.Text))
            {
                int width = int.Parse(txtWidth.Text);
                int height = int.Parse(txtHeight.Text);
                amTransform.Height(height);
                amTransform.Width(width);
                if (ddFit.SelectedValue != "0")
                {
                    switch (ddFit.SelectedValue)
                    {
                        case "1":
                            amTransform.Fit(Amend.FIT_XY);
                            break;
                        case "2":
                            amTransform.Fit(Amend.FIT_WIDTH);
                            break;
                        case "3":
                            amTransform.Fit(Amend.FIT_HEIGHT);
                            break;
                        case "4":
                            amTransform.Fit(Amend.FIT_FILL);
                            break;
                        case "5":
                            amTransform.Fit(Amend.FIT_INSIDE);
                            break;
                        case "6":
                            amTransform.Fit(Amend.FIT_FACE);
                            break;
                    }
                }
                if (ddAlign.SelectedValue != "0")
                {
                    switch (ddAlign.SelectedValue)
                    {
                        case "1":
                            amTransform.Align(Amend.LEFT);
                            break;
                        case "2":
                            amTransform.Align(Amend.RIGHT);
                            break;
                        case "3":
                            amTransform.Align(Amend.CENTER);
                            break;
                        case "4":
                            amTransform.Align(Amend.TOP);
                            break;
                        case "5":
                            amTransform.Align(Amend.BOTTOM);
                            break;
                    }
                }
                if (ddListColor.SelectedValue != "0")
                {
                    amTransform.Color(ddListColor.SelectedItem.Text);
                }
                if (!string.IsNullOrEmpty(txtOriginX.Text))
                {
                    amTransform.X(int.Parse(txtOriginX.Text));
                }
                if (!string.IsNullOrEmpty(txtOriginY.Text))
                {
                    amTransform.Y(int.Parse(txtOriginY.Text));
                }

            }
            else if (!string.IsNullOrEmpty(txtWidth.Text))
            {
                int width = int.Parse(txtWidth.Text);
                amTransform.Width(width);
            }
            else if (!string.IsNullOrEmpty(txtHeight.Text))
            {
                int height = int.Parse(txtHeight.Text);
                amTransform.Height(height);
            }
            op.Transform(amTransform);
            if (!string.IsNullOrEmpty(txtBright.Text))
            {
                op.Effects(new AmendEffects().Brightness(txtBright.Text));
            }
            if (!string.IsNullOrEmpty(txtContrast.Text))
            {
                op.Effects(new AmendEffects().Contrast(txtContrast.Text));
            }
            if (!string.IsNullOrEmpty(txtOverlayImage.Text))
            {
                AmendOverlay ov = new AmendOverlay();
                ov.image(txtOverlayImage.Text);
                if (!string.IsNullOrEmpty(txtOverlayPosX.Text) && !string.IsNullOrEmpty(txtOverlayPosY.Text))
                {
                    ov.x(int.Parse(txtOverlayPosX.Text));
                    ov.y(int.Parse(txtOverlayPosX.Text));
                }
                else if (!string.IsNullOrEmpty(txtOverlayPosX.Text))
                {
                    ov.x(int.Parse(txtOverlayPosX.Text));
                }
                else if (!string.IsNullOrEmpty(txtOverlayPosY.Text))
                {
                    ov.y(int.Parse(txtOverlayPosY.Text));
                }
                op.Overlay(ov);
            }
            if (!string.IsNullOrEmpty(txtOverlayText.Text))
            {
                AmendOverlay ov = new AmendOverlay();
                ov.text(txtOverlayText.Text);
                if (!string.IsNullOrEmpty(txtTextSize.Text))
                {
                    ov.size(int.Parse(txtTextSize.Text));
                }
                if (ddTextColor.SelectedValue != "0")
                {
                    ov.color(ddTextColor.SelectedItem.Text);
                }
                if (chkBold.Checked)
                {
                    ov.style(Amend.BOLD);
                }
                if (chkItalic.Checked)
                {
                    ov.style(Amend.ITALIC);
                }
                if (!string.IsNullOrEmpty(txtOverlayPosX.Text) && !string.IsNullOrEmpty(txtOverlayPosY.Text))
                {
                    ov.x(int.Parse(txtOverlayPosX.Text));
                    ov.y(int.Parse(txtOverlayPosY.Text));
                }
                else if (!string.IsNullOrEmpty(txtOverlayPosX.Text))
                {
                    ov.x(int.Parse(txtOverlayPosX.Text));
                }
                else if (!string.IsNullOrEmpty(txtOverlayPosY.Text))
                {
                    ov.y(int.Parse(txtOverlayPosY.Text));
                }
                op.Overlay(ov);
            }
            if (!string.IsNullOrEmpty(txtQuality.Text))
            {
                op.Quality(int.Parse(txtQuality.Text));
            }
            if (!string.IsNullOrEmpty(txtRadius.Text))
            {
                if (txtRadius.Text == "Max")
                {
                    op.Radius(Amend.MAX);
                }
                else
                {
                    op.Radius(int.Parse(txtRadius.Text));
                }
            }
            if (chkFlipX.Checked && chkFlipY.Checked)
            {
                op.Flip(Amend.XY);
            }
            else if (chkFlipX.Checked)
            {
                op.Flip(Amend.X);
            }
            else if (chkFlipY.Checked)
            {
                op.Flip(Amend.Y);
            }
            if (chkInvert.Checked)
            {
                op.Invert();
            }
            if (!string.IsNullOrEmpty(txtAngle.Text))
            {
                op.Rotate(int.Parse(txtAngle.Text));
            }
            op.GrayScale(chkGrayScale.Checked);
            if (!string.IsNullOrEmpty(ImageId))
            {
                Amend.Init().Load(ImageId, op).Into(Image1);
            }
            else if (!string.IsNullOrEmpty(ImageUrl))
            {
                Amend.Init().Fetch(ImageUrl, op).Into(Image1);
            }
        }
    }
}