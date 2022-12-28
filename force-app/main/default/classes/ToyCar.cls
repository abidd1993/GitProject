public class ToyCar {
    public void createToyCar(Integer noOfWheels, Integer noOfCarBody, Integer noOfFigures){
        Integer wheelSet = noOfWheels/4;
        Integer peopleSet = noOfFigures/2;
		Integer noOfCars = Math.Min(noOfCarBody, math.min(wheelSet, peopleSet));
        system.debug('Number of cars that can be made from given parts are '+noOfCars);
    }

}