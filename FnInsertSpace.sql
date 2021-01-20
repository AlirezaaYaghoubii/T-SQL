Create Function [dbo].[FnInsertSpace](@Data Varchar(Max))
Returns Varchar(Max)
As
Begin

Declare @ResultData Varchar(Max),@Len Int,@SubData Varchar(1),@I Int

Set @Data=LTRIM(RTRIM(@Data))
Set @Len=Len(@Data)
Set @I=1
Set @ResultData=''

While(@I<=@Len)
Begin

Set @SubData=Substring(@Data,@I,1)
Set @I=@I+1

Set @ResultData=@ResultData+' '+@SubData

End--While(@I<=@Len)

Return @ResultData

End