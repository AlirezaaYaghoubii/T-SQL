Create Function FnTrimAllExtraSpace(@Data Nvarchar(Max))
Returns Nvarchar(Max) 

As 
Begin 

Set @Data=LTRIM(RTRIM(@Data))
Set @Data=REPLACE(@Data,CHAR(10),'')
Set @Data=REPLACE(@Data,CHAR(13),'')
Set @Data=REPLACE(@Data,NCHAR(1603),NCHAR(1705))
Set @Data=REPLACE(@Data,NCHAR(1610),NCHAR(1740))

While (CHARINDEX('  ',@Data)<>0)
Set @Data=REPLACE(@Data,'  ',' ') 


Return @Data

End 
