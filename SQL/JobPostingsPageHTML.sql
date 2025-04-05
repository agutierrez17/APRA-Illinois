SELECT
'<div id="id_swRQGSR" class="WaGadget WaGadgetContent  gadgetStyleNone" style="background-color:transparent;" data-componentid="swRQGSR"><div class="gadgetStyleBody gadgetContentEditableArea" style="padding-top:5px;" data-editablearea="0" data-areaheight="auto">' +
REPLACE(REPLACE(REPLACE(REPLACE(
STUFF((
SELECT ' ' +
'<p style="margin-bottom: 0px !important; margin-top: 0px !important;"><font><font><font><span><font><span><strong><a href="' + RTRIM([Link]) + '" target="_blank">' +

'<u>' + RTRIM([Job Title]) + '</u></a>&nbsp;</strong><span>-</span></span><span><span>&nbsp;</span>' + 

'<span>' + FORMAT ([Date Posted], 'd', 'en-US') + '</span></span></font></span></font></font></font></p>' +

'<p style="margin-top: 0px !important; margin-bottom: 0px;"><font><font><font><font color="#2E4261">' + RTRIM([Organization]) + 

'<font face="Georgia, Times New Roman, Times, serif, WaWebKitSavedSpanIndex_9, WaWebKitSavedSpanIndex_10">&nbsp;</font><span>| ' + RTRIM([Location]) + CASE WHEN [Salary Range] = '' THEN '' ELSE ' |&nbsp;' + RTRIM([Salary Range]) END + '</span></font></font></font></font></p>' +

'<p style="margin-top: 0px !important; margin-bottom: 0px;"><font><font><font><font color="#2E4261"><span><br></span></font></font></font></font></p>'

FROM dbo.[JobPostings] WITH (NOLOCK)
WHERE [Active] = 'Y'
ORDER BY [Date Posted] DESC
FOR XML PATH('')), 1, 1, ''),'&lt;','<'),'&gt;','>'),'&nbsp;',' '),'&amp;','&') + '</div></div>' 
AS HTML