declare namespace message="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/message";
declare namespace s="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/structure";
declare namespace c="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/common";

for $data in doc('/home/kincaid/Downloads/drive-download-20240914T222313Z-001/DataStructure.xml')//message:Structure/message:Structures/s:Codelists/s:Codelist
return $data