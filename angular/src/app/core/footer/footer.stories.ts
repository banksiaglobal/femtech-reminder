import { Story, Meta } from '@storybook/angular/types-6-0';
import { moduleMetadata } from '@storybook/angular';
import { CommonModule } from '@angular/common';
import { FooterComponent } from './footer.component';



export default {
  title: 'Core/Footer',
  component: FooterComponent,
  argTypes: {
    backgroundColor: { control: 'color' },
  },
  decorators: [
    moduleMetadata({
      imports: [CommonModule],
    }),
  ],
} as Meta;

const Template: Story<FooterComponent> = (args: FooterComponent) => ({
  props: args,
});

export const Demo = Template.bind({});
Demo.args = {

};