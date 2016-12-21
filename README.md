Amend
==========

amend is a cloud-based service that provides an end-to-end image management solution including uploads, storage, manipulations, optimizations and delivery.

With amend you can easily upload images to the cloud, automatically perform smart image manipulations without installing any complex software. All your images are then seamlessly delivered through a fast CDN, optimized and using industry best practices. amend offers comprehensive APIs and administration capabilities and is easy to integrate with new and existing web and mobile applications.

amend offers comprehensive APIs and administration capabilities and is easy to integrate with any web application, existing or new.

amend provides URL and HTTP based APIs that can be easily integrated with any Web development framework. 

For projects based on Microsoft .NET Framework, amend provides a library for simplifying the integration even further.

## Getting started guide
[Getting started guide for .NET]

## Setup ######################################################################

amend .NET library is available as NuGet package at https://nuget.org/packages/amend

Please see NuGet Documentation at http://docs.nuget.org/ for instructions of how to work with NuGet packages.

### Using Visual Studio

1. Download NuGet Package Manager at http://visualstudiogallery.msdn.microsoft.com/27077b70-9dad-4c64-adcf-c7cf6bc9970c
2. Use Visual Studio to create a new project and choose .NET 3.5 as the target framework.
3. Right click on the project in Solution Explorer and click on Manage NuGet packages...
4. Type Amend in the search box at the upper right corner.
5. When Amend package appears, click on the Install button.
6. After the package is installed click Close button.
7. Setup is done and you can now use Amend.

### Manual setup

1. Go to https://nuget.org/packages/amend and download NuGet package.
2. NuGet package is a ZIP archive that could be extracted using any unzip tool.
3. NuGet package contains amend.dll, xml documentation and this file.

## Try it right away

Sign up for a [free account](http://developer.amendcloud.com/Register) so you can try out image transformations and seamless image delivery through CDN.

*Note: Replace `demo` in all the following examples with your amend's `amend name`.*  

Accessing an uploaded image with the `pc` public ID through a CDN:

    http://amend.cloud/demo/image/pc.jpg

![Sample](http://amend.cloud/demo/image/w_300/pc.jpg "Sample")

Generating a 150x100 version of the `pc` image and downloading it through a CDN:

    http://amend.cloud/demo/image/w_150,h_100,fit_fill/pc.jpg

![Sample 150x100](http://amend.cloud/demo/image/w_150,h_100,fit_fill/pc.jpg "Sample 150x100")

Converting to a 150x100 PNG with rounded corners of 25 pixels: 

    http://amend.cloud/demo/image/w_150,h_100,fit_fill/r_25/pc.jpg

![Sample 150x150 Rounded PNG](http://amend.cloud/demo/image/w_150,h_100,fit_fill/r_25/pc.jpg "Sample 150x150 Rounded PNG")

For plenty more transformation options, see our [image transformations documentation](http://amend.com/documentation/image_transformations).
 
## Usage

### Configuration

Each request for building a URL of a remote cloud resource must have the `amend_name` parameter set. 
Each request to our secure APIs (e.g., image uploads) must have the `access_key` and `access_secret` parameters set. 


Setting the `amend_name`, `access_key` and `access_secret` parameters can be done either directly in each call to a amend  method, 
by when initializing the amend object.

The main entry point of the library is the Amend object.

	Amend.setAmendName("my_amend_name");
	Amend.setCredentials("my_access_key", "my_access_secret");


### Upload

Assuming you have your amend configuration parameters defined (`amend_name`, `access_key`, `access_secret`), uploading to amend is very simple.
    
The following example uploads a local JPG to the cloud: 

	Amend amend = new Amend();
	
	Amend.AmendResponse resp = await amend.UploadAsync(System.IO.File.ReadAllBytes(@"c:\mypicture.jpg"));
    
	    
The uploaded image is assigned a randomly generated public Name. The image is immediately available for download through a CDN:

    string url = resp.CDNUrl;
        
    http://amend.cloud/cloud_name/image/cloud_name112128
	
or you can get Image Name return by amend upload api

	string imageName = resp.ImageName;

You can also specify your own Image Name:    
    
    Amend.AmendResponse resp = await amend.UploadAsync(System.IO.File.ReadAllBytes(@"c:\mypicture.jpg"),"MyOwnFileName");
		
    http://amend.cloud/cloud_name/image/MyOwnFileName.jpg

	
### Embedding and transforming images

Any image uploaded to amend can be transformed and embedded using powerful view helper methods:

The following example generates the url for accessing an uploaded `pc` image while transforming it to fill a 100x150 rectangle and set on Image img

	AmendOptions amendOptions = new AmendOptions().Transform(new Transform().Width(100).Height(150).Fit(Amend.FIT_FILL));
    Amend.Init().Load('pc', amendOptions).Into(img);

Another example, emedding a smaller version of an uploaded image while generating a 90x90 face detection based thumbnail: 

	AmendOptions amendOptions = new AmendOptions().Transform(new Transform().Width(90).Height(90).Fit(Amend.FIT_FACE));
    Amend.Init().Load('woman', amendOptions).Into(img);
	  
  
## Additional resources

Additional resources are available at:

* [Website](http://amendcloud.com)
* [Documentation](http://amendcloud.com/documentation.html)

## Support

Contact us at [support@amendcloud.com](mailto:support@amendcloud.com)

Or via Twitter: [@amend](https://twitter.com/#!/amendcloud)