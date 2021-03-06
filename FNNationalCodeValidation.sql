USE [DbCrouse]
GO
/****** Object:  UserDefinedFunction [dbo].[FNNationalCodeValidation]    Script Date: 05/16/2021 08:43:31 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Function [dbo].[FNNationalCodeValidation](@Code Varchar(50))
Returns Bit
As
Begin

-- Select dbo.FNNationalCodeValidation('5699221891')
-- Select dbo.FNNationalCodeValidation('0000642547')
-- Select dbo.FNNationalCodeValidation('0020642547')

DECLARE @RET BIT=1

IF LEN(@Code)=0 SET @RET=0
IF LEN(@Code)<>10 SET @RET=0
IF ISNUMERIC(@Code)=0 SET @RET=0
IF @Code LIKE '% %' SET @RET=0


IF @Code IN ('0000000000','1111111111','2222222222','3333333333','4444444444'
,'5555555555','6666666666','7777777777','8888888888','9999999999')
SET @RET=0



IF @RET=1
BEGIN

DECLARE @NUM1 INT,@NUM2 INT,@NUM3 INT,@NUM4 INT,@NUM5 INT,@NUM6 INT
,@NUM7 INT,@NUM8 INT,@NUM9 INT,@A INT,@B INT,@C INT

SET @NUM1=SUBSTRING(@Code,1,1)*10
SET @NUM2=SUBSTRING(@Code,2,1)*9
SET @NUM3=SUBSTRING(@Code,3,1)*8
SET @NUM4=SUBSTRING(@Code,4,1)*7
SET @NUM5=SUBSTRING(@Code,5,1)*6
SET @NUM6=SUBSTRING(@Code,6,1)*5
SET @NUM7=SUBSTRING(@Code,7,1)*4
SET @NUM8=SUBSTRING(@Code,8,1)*3
SET @NUM9=SUBSTRING(@Code,9,1)*2
SET @A=SUBSTRING(@Code,10,1)

SET @B = (((((((@NUM1 + @NUM2) + @NUM3) + @NUM4) + @NUM5) + @NUM6) + @NUM7) + @NUM8) + @NUM9
SET @C = @B % 11

SET @RET=0

IF (((@C < 2) AND (@A = @C)) OR  ((@C >= 2) AND ((11 - @C) = @A)))
SET @RET=1

END--IF @RET=1

RETURN @RET

End