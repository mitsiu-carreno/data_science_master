declare namespace message="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/message";
declare namespace s="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/structure";
declare namespace c="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/common";

for $codelist in doc('/home/kincaid/Downloads/drive-download-20240914T222313Z-001/DataStructure.xml')//message:Structure/message:Structures/s:Codelists/s:Codelist[@id = "CL_COMMODITY"]
return <table>
  <tr>
    <th>Name</th>
    <th>Code</th>
    <th>Lang</th>
  </tr>
  
    {
      for $code in $codelist/s:Code
      return 
      <tr>
        <td>{$code/c:Name/text()}</td>
        <td>{data($code/@id)}</td>
        <td>{data($code/c:Name/@xml:lang)}</td>
      </tr>
    }
 
</table>