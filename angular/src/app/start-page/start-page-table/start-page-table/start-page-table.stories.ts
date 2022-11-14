import { Story, Meta } from '@storybook/angular/types-6-0';
import { moduleMetadata } from '@storybook/angular';
import { CommonModule } from '@angular/common';
import { StartPageComponentTableComponent } from './start-page-component-table.component';



export default {
  title: 'App/List users',
  component: StartPageComponentTableComponent,
  argTypes: {
    backgroundColor: { control: 'color' },
  },
  decorators: [
    moduleMetadata({
      imports: [CommonModule],
    }),
  ],
} as Meta;
const usersList = [{name:"Mendoza384",lastName:"Nesterenko",birthdayDate:45221,telegramID:435242786},{name:"Mendoza384",lastName:"Nesterenko",birthdayDate:45221,telegramID:435242786}];
const Template: Story<StartPageComponentTableComponent> = (args: StartPageComponentTableComponent) => ({
  props: args,
});



export const DemoEmpty = Template.bind({});
DemoEmpty.args = {
data: []
};

export const DemoFull = Template.bind({});
DemoFull.args = {
  data: usersList,
  displayedColumns: ['name', 'lastName', 'birthdayDate', 'telegramID'],

};
