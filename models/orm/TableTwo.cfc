// component persistent=true accessors=true table="TableTwo" schema="dbo" {
component persistent=true accessors=true table="TableTwo" schema="dbo"  extends="cborm.models.ActiveEntity"{
    property name="GUID" column="GUID" fieldType="id" generator="guid";
    property name="Namex";

    public function preInsert(){
        variables.namex = 'tabletwo name ' & getTickCount();
        writeoutput( 'TableTwo pre insert - name is #getNamex()#')
    }
}