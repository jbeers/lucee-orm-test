// component persistent=true accessors=true table="TableOne" schema="dbo" {
component persistent=true accessors=true table="TableOne" schema="dbo" extends="cborm.models.ActiveEntity" {
    property name="GUID" column="GUID" fieldType="id" generator="guid";
    property name="Name";

    public function preInsert(){
        writeoutput( 'Tableone pre insert - name is #getName()#')
    }
}