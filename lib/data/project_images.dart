/// Project images configuration
/// Add your project screenshots here
class ProjectImages {
  // E-Commerce App Screenshots
  static const String ecommerceHome = 'assets/images/projects/ecommerce_home.png';
  static const String ecommerceProduct = 'assets/images/projects/ecommerce_product.png';
  static const String ecommerceCart = 'assets/images/projects/ecommerce_cart.png';
  static const String ecommerceCheckout = 'assets/images/projects/ecommerce_checkout.png';
  
  // Food Delivery App Screenshots
  static const String foodHome = 'assets/images/projects/food_home.png';
  static const String foodMenu = 'assets/images/projects/food_menu.png';
  static const String foodCart = 'assets/images/projects/food_cart.png';
  static const String foodTracking = 'assets/images/projects/food_tracking.png';
  
  // E-Taxi App Screenshots
  static const String taxiHome = 'assets/images/projects/taxi_home.png';
  static const String taxiMap = 'assets/images/projects/taxi_map.png';
  static const String taxiBooking = 'assets/images/projects/taxi_booking.png';
  static const String taxiDriver = 'assets/images/projects/taxi_driver.png';
  
  // Get all screenshots for a project
  static List<String> getProjectScreenshots(String projectTitle) {
    switch (projectTitle) {
      case 'E-Commerce Mobile App':
        return [ecommerceHome, ecommerceProduct, ecommerceCart, ecommerceCheckout];
      case 'Food Delivery App':
        return [foodHome, foodMenu, foodCart, foodTracking];
      case 'E-Taxi Booking App':
        return [taxiHome, taxiMap, taxiBooking, taxiDriver];
      default:
        return [];
    }
  }
  
  // Get primary screenshot for project card
  static String? getPrimaryScreenshot(String projectTitle) {
    final screenshots = getProjectScreenshots(projectTitle);
    return screenshots.isNotEmpty ? screenshots.first : null;
  }
}
