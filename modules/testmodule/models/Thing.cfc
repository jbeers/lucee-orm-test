// component persistent="true" accessors=true table="Thing" schema="dbo" entityName='Thing' {
component persistent="true" accessors=true table="Thing" schema="dbo" entityName='Thing' extends="cborm.models.ActiveEntity"{
    property name="GUID" column="GUID" fieldType="id" generator="guid";
    property name="Name";

    public function preInsert(){
        writeoutput( 'Thing preInsert - name is #getName()#')
    }

    public function preUpdate(){
        writeoutput( 'Thing preUpdate - name is #getName()#')
    }
}