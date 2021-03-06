drop procedure [dpSearchSite]
/****** Object:  StoredProcedure [dbo].[dpSearchSiteNwPublishedContent]    Script Date: 03/23/2010 13:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[dpSearchSite]
(
	@freesearch nvarchar(250),
	@site_url nvarchar(250)
)
AS
/***************************************************************************
Date: 11-01-2010
Author: Jan de Bruin
Description: Search in gegevensbronnen by nw_published_content_search_index
Revisions
           Modification              
Date     (Functional/Fix)   Author              Description
----------------------------------------------------------------------------
20100113    Functional      M. de Leeuw         Geen dubbele resultaten, een contentfragment staat meerdere keren in de database alleen dan met een andere url
20100323    Functional      J. de Bruin         Nieuw naam, url toegevoegd.
***************************************************************************/
BEGIN
	CREATE TABLE #TEMP (ID int, weight int)

    INSERT INTO #TEMP
        SELECT distinct nw_published_content_search_index.nw_published_content_id as ID , nw_published_content_search_index.nw_published_content_search_index_weight as weight
        FROM dbo.nw_published_content_search_index
		inner join dbo.nw_published_content
on nw_published_content.nw_published_content_id=nw_published_content_search_index.nw_published_content_id
        WHERE CONTAINS(dbo.nw_published_content_search_index.nw_published_content_search_index_value, @freesearch)
and nw_published_content.nw_published_content_url like @site_url + '%' and nw_published_content.item_online=1

declare @countnr int
select @countnr=count(*) from  #TEMP
print  @countnr 
    
	select top 150 nw_published_content.nw_published_content_url as content_url,nw_published_content.nw_published_label  as naam , Sum(#TEMP.weight) as count from #TEMP
inner join nw_published_content
on nw_published_content_id=ID 
inner join nw_published_content as parent
on nw_published_content.nw_published_content_url=parent.nw_published_content_url
where nw_published_content.item_online=1 and parent.nw_published_content_is_page=1 and parent.item_online=1 
group by nw_published_content.nw_published_content_url,nw_published_content.nw_published_label
order by 3 desc
	/*SELECT distinct TOP (100) PERCENT 
        (SELECT TOP 1 consub.nw_published_content_url 
        FROM nw_published_content consub
        WHERE consub.object_id = con.object_id
            AND consub.object_type_id = con.object_type_id
            AND consub.item_online = 1
        ORDER BY consub.nw_published_content_url) as content_url,
	    csiNaam.nw_published_content_search_index_value as naam                          
    FROM  dbo.nw_published_content con
        INNER JOIN #TEMP ON
            con.nw_published_content_id = #TEMP.ID
        INNER JOIN nw_published_content_search_index csiNaam ON 
		    csiNaam.nw_published_content_id = con.nw_published_content_id 
			AND con.item_online = 1
        INNER JOIN nw_published_content_search_index csiAttributeCheck ON
            csiAttributeCheck.nw_published_content_search_index_xpath = csiNaam.nw_published_content_search_index_xpath + '/@layout'
    WHERE csiNaam.nw_published_content_search_index_element_name = 'documenttitle'
	    AND csiNaam.nw_published_content_search_index_attribute_name IS NULL
		AND csiNaam.nw_published_content_search_index_xpath LIKE '///kompasdocument%'				
	    AND csiAttributeCheck.nw_published_content_search_index_value='Titel document'	
*/
    DROP TABLE #TEMP
END
