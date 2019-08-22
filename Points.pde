float points(){ //updates and returns score and checked what happened with the portals
  if(collect){
    String type = portal.type();
    if(type.equals("double")){
      point=point*2;
    } else if(type.equals("normal")){
      point+=1000;
    } else if(type.equals("half")){
      point=point/2;
    }  
  } 
  return point;
}