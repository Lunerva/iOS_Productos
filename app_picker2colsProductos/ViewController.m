//
//  ViewController.m
//  app_picker2colsProductos
//
//  Created by Luis Barranco on 22/10/24.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *productos;
    NSArray *colores;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    productos = @[@"Pantalla LCD",@"iPad",@"Bicicleta",@"Motocicleta",@"Carro",@"Camioneta"];
    colores = @[@"rojo🦀",@"verde🦖",@"Azul🦕",@"gris🦛",@"naranja🐅",@"cafe🦇",@"amarillo🐝",@"aleatorio"];
    
    _pickerView1.delegate =self;
    _pickerView1.dataSource=self;
    _label1.text = [NSString stringWithFormat:@"%@,%@",[productos objectAtIndex:0],[colores objectAtIndex:0]];
    
    _imageView1.image = [UIImage imageNamed:@"PantallaLCD"];
    
    UIColor *color = [UIColor colorWithRed:0 green:155 blue:100 alpha:1.0];
    
    self.view.backgroundColor = color;
    
    NSLog(@"%@",_label1.text);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component==0){
        return productos.count;
    }else{
        return colores.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component==0){
        return  [productos objectAtIndex:row];
    }else{
        return  colores[row];
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _label1.text = [NSString stringWithFormat:@"%@ , %@",[productos objectAtIndex:[_pickerView1 selectedRowInComponent:0]],[colores objectAtIndex:[_pickerView1 selectedRowInComponent:1]]];
    
    
//    _label1.text = [NSString stringWithFormat:@"%@ , %@",productos[_pickerView1[1]],colores[_pickerView1[1]]];
    unsigned long int color = [colores indexOfObject:[colores objectAtIndex:[pickerView selectedRowInComponent:1]]];
    
    
    switch(color){
        case 0:
            self.imageView1.backgroundColor = [UIColor redColor];
            break;
        case 1:
            self.imageView1.backgroundColor = [UIColor greenColor];
            break;
            
    }
}


@end


