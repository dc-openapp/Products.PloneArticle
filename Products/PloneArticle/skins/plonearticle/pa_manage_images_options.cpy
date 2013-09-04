## Script (Python) "pa_manage_images_options"
##bind container=container
##bind context=context
##bind namespace=
##bind script=script
##bind state=state
##bind subpath=traverse_subpath
##parameters=imageMaxSizes, referenceableImageTypes, maxPreviewImageWidth, maxPreviewImageHeight, maxThumbWidth, maxThumbHeight
##title=
##
from Products.CMFCore.utils import getToolByName
from Products.CMFPlone import PloneMessageFactory as _
tool = getToolByName(context, 'plonearticle_tool')

## the dict on which we loop must contain all the portal types
for portal_type, imageMaxSize in imageMaxSizes.items():
    maxPreviewImageWidthValue = maxPreviewImageWidth.get(portal_type, 300)
    maxPreviewImageHeightValue = maxPreviewImageHeight.get(portal_type, 200)
    maxThumbWidthValue = maxThumbWidth.get(portal_type, 40)
    maxThumbHeightValue = maxThumbHeight.get(portal_type, 40)

    referenceableImageType = referenceableImageTypes.get(portal_type, [])
    ## if portal_type in previewsAllowed.keys() then previewAllowed = True else...
    tool.setOptionsForType(portal_type, "image", "referenceableImageType",
                           referenceableImageType = referenceableImageType,
                           imageMaxSize = imageMaxSize,
                           maxPreviewImageWidth = maxPreviewImageWidthValue,
                           maxPreviewImageHeight = maxPreviewImageHeightValue,
                           maxThumbWidth = maxThumbWidthValue,
                           maxThumbHeight = maxThumbHeightValue,
                           )

message = _(u'Changes saved.')
context.plone_utils.addPortalMessage(message)
return state
