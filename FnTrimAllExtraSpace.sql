Create Function FnTrimAllExtraSpace(@Data Nvarchar(Max))
Returns Nvarchar(Max) 

As 
Begin 

Set @Data=Ltrim(Rtrim(@Data))

While (CHARINDEX('  ',@Data)<>0)
Set @Data=REPLACE(@Data,'  ',' ') 


Return @Data

End 
